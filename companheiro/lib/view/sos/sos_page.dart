import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '/controller/auth_controle.dart';

// ─────────────────────────────────────────────
//  MODEL
// ─────────────────────────────────────────────

class SosReport {
  final String id;
  final File? foto;
  final double latitude;
  final double longitude;
  final String enderecoFisico;
  final String relatoUsuario;
  final DateTime criadoEm;

  SosReport({
    required this.id,
    this.foto,
    required this.latitude,
    required this.longitude,
    required this.enderecoFisico,
    this.relatoUsuario = '',
    DateTime? criadoEm,
  }) : criadoEm = criadoEm ?? DateTime.now();
}

// ─────────────────────────────────────────────
//  PAGE
// ─────────────────────────────────────────────

class SosPage extends StatefulWidget {
  const SosPage({super.key});

  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  List<SosReport> _reportes = [];
  bool _carregando = false;

  @override
  void initState() {
    super.initState();
    _carregarSos();
  }

  Future<void> _carregarSos() async {
    final auth =
        Provider.of<AuthController>(context, listen: false);

    final uid = auth.usuarioLogado.id;

    final snapshot = await FirebaseFirestore.instance
        .collection('sos')
        .where('uid', isEqualTo: uid)
        .get();

    final lista = snapshot.docs.map((doc) {
      final dados = doc.data();

      return SosReport(
        id: doc.id,
        foto: null,
        latitude: 0,
        longitude: 0,
        enderecoFisico: dados['cidade'] ?? '',
        relatoUsuario: dados['descricao'] ?? '',
      );
    }).toList();

    setState(() {
      _reportes = lista;
    });
  }
  // ── Abrir Google Maps ──────────────────────
  Future<void> _abrirMapa(double lat, double lng) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Não foi possível abrir o mapa.')),
        );
      }
    }
  }

  // ── Verificar / pedir permissão de localização ──
  Future<Position?> _obterPosicao() async {
    bool servicoAtivo = await Geolocator.isLocationServiceEnabled();
    if (!servicoAtivo) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ative o GPS do dispositivo.')),
        );
      }
      return null;
    }

    LocationPermission permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Permissão de localização negada.')),
          );
        }
        return null;
      }
    }
    if (permissao == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Permissão de localização negada permanentemente. '
              'Habilite nas configurações do app.',
            ),
          ),
        );
      }
      return null;
    }

    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // ── Converter coordenadas em endereço ──────
  Future<String> _obterEndereco(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        final partes = [
          if ((p.street ?? '').isNotEmpty) p.street,
          if ((p.subLocality ?? '').isNotEmpty) p.subLocality,
          if ((p.locality ?? '').isNotEmpty) p.locality,
        ];
        return partes.join(', ');
      }
    } catch (_) {}
    return 'Lat: ${lat.toStringAsFixed(5)}, Lng: ${lng.toStringAsFixed(5)}';
  }

  // ── Dialog para o relato do usuário ────────
  Future<String?> _pedirRelato() async {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Descreva o problema'),
        content: TextField(
          controller: controller,
          maxLines: 4,
          maxLength: 300,
          decoration: const InputDecoration(
            hintText: 'Ex: Árvore caída bloqueando a via... (opcional)',
            border: OutlineInputBorder(),
          ),
          textCapitalization: TextCapitalization.sentences,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(''), // pula o relato
            child: const Text('Pular'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  // ── Dialog para escolher câmera ou galeria ──
  Future<File?> _escolherFoto() async {
    final picker = ImagePicker();
    ImageSource? fonte;

    await showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Tirar foto'),
              onTap: () {
                fonte = ImageSource.camera;
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Escolher da galeria'),
              onTap: () {
                fonte = ImageSource.gallery;
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Sem foto'),
              onTap: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      ),
    );

    if (fonte == null) return null;

    final picked = await picker.pickImage(
      source: fonte!,
      imageQuality: 80,
      maxWidth: 1280,
    );
    return picked != null ? File(picked.path) : null;
  }

  // ── Criar novo alerta S.O.S ─────────────────
  Future<void> _criarNovoAlerta() async {
    // 1. Escolher foto
    final foto = await _escolherFoto();

    setState(() => _carregando = true);

    try {
      // 2. Obter localização
      final posicao = await _obterPosicao();
      if (posicao == null) {
        setState(() => _carregando = false);
        return;
      }

      // 3. Converter para endereço legível
      final endereco = await _obterEndereco(
        posicao.latitude,
        posicao.longitude,
      );

      setState(() => _carregando = false);

      // 4. Pedir relato (fora do setState para aguardar input)
      final relato = await _pedirRelato() ?? '';

      final authController = Provider.of<AuthController>(context, listen: false);
      String cidade = '';

      try{
        final placemarks = await placemarkFromCoordinates(posicao.latitude, posicao.longitude);
        if (placemarks.isNotEmpty) {
          cidade = placemarks.first.locality ?? '';
        }
      } catch (_) {}

      await authController.criarSos(
        titulo: 'SOS',
        descricao: relato.isEmpty
          ?'SOS enviado pleo aplicativo'
          : relato,
        cidade: cidade,
      );

      // 5. Salvar na lista
      setState(() {
        _reportes.insert(
          0,
          SosReport(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            foto: foto,
            latitude: posicao.latitude,
            longitude: posicao.longitude,
            enderecoFisico: endereco,
            relatoUsuario: relato,
          ),
        );
      });
    } catch (e) {
      setState(() => _carregando = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao criar alerta: $e')),
        );
      }
    }
  }

  // ── Build ───────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('S . O . S'),
          ),
          body: _reportes.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      'Nenhum alerta S.O.S registrado ainda.\n'
                      'Clique no botão abaixo para adicionar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: _reportes.length,
                  itemBuilder: (context, index) {
                    final reporte = _reportes[index];
                    return _SosCard(
                      reporte: reporte,
                      onTap: () =>
                          _abrirMapa(reporte.latitude, reporte.longitude),

                      onDelete: () async {
                        final auth = Provider.of<AuthController>(context, listen: false);
                        await auth.deletarSos(reporte.id);
                        setState(() {
                          _reportes.removeWhere((r) => r.id == reporte.id);
                        });
                      },
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _carregando ? null : _criarNovoAlerta,
            icon: const Icon(Icons.add_a_photo),
            label: const Text('Novo S.O.S'),
          ),
        ),

        // Overlay de carregamento
        if (_carregando)
          Container(
            color: Colors.black45,
            child: const Center(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Obtendo localização...'),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  CARD WIDGET
// ─────────────────────────────────────────────

class _SosCard extends StatelessWidget {
  final SosReport reporte;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _SosCard({required this.reporte, required this.onTap, required this.onDelete});

  String _formatarData(DateTime dt) {
    final d = dt;
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/'
        '${d.year}  '
        '${d.hour.toString().padLeft(2, '0')}:'
        '${d.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Foto ──────────────────────────
            SizedBox(
              height: 200,
              child: reporte.foto!= null && reporte.foto!.existsSync()
                  ? Image.file(reporte.foto!, fit: BoxFit.cover)
                  : Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
            ),

            // ── Informações ───────────────────
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
                    ),
                  ),
                  // Data/hora
                  Text(
                    _formatarData(reporte.criadoEm),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),

                  // Endereço
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          reporte.enderecoFisico,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Relato opcional
                  if (reporte.relatoUsuario.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      '"${reporte.relatoUsuario}"',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                  ],

                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.map_outlined, color: Colors.blue, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'Toque para ver no mapa',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
