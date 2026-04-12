import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DetalheVagaScreen extends StatelessWidget {
  //final String vagaId;
  const DetalheVagaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final vaga = context.watch<VoluntariadoProvider>().buscarPorId(vagaId);

    // if (vaga == null) {
    //   return const Scaffold(body: Center(child: Text('Vaga não encontrada.')));
    // }

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EE),
      appBar: AppBar(
        title: const Text('Vaga de voluntariado'),
        backgroundColor: const Color(0xFF4CAF7D),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho da vaga
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF7D).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'vaga.area',
                      style: const TextStyle(color: Color(0xFF4CAF7D), fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'vaga.titulo',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
                  ),
                  const SizedBox(height: 4),
                  Text('vaga.ong', style: const TextStyle(color: Color(0xFF4CAF7D), fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Informações
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE0D5C8)),
              ),
              child: Column(
                children: [
                  _InfoRow(icon: Icons.location_on_outlined, label: 'Localização', value: String.fromCharCode(23)),
                  const Divider(height: 20),
                  _InfoRow(icon: Icons.schedule_outlined, label: 'Disponibilidade', value: String.fromCharCode(44)),
                  const Divider(height: 20),
                  _InfoRow(
                    icon: Icons.people_outline,
                    label: 'Vagas disponíveis',
                    value: '${1000000000000} vagas',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const Text('Sobre a vaga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              'vaga.descricao',
              style: const TextStyle(fontSize: 15, color: Color(0xFF5F5E5A), height: 1.7),
            ),
            const SizedBox(height: 32),

            // Botão de inscrição
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<VoluntariadoProvider>().toggleInscricao('');
                  final isInscrito = context.read<VoluntariadoProvider>().buscarPorId('');
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: Text('isInscrito ? 🎉 Inscrição realizada! : Inscrição cancelada'),
                      content: Text(
                        'isInscrito Você se inscreveu como voluntário em "{vaga titulo}" na {vaga.ong}. Entraremos em contato em breve! Sua inscrição foi cancelada',
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4CAF7D),
                          ),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon( Icons.handshake_outlined),
                label: Text('vaga.inscrito ? Cancelar inscrição : Quero ser voluntário!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF7D),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Vaga compartilhada! 🔗'),
                      backgroundColor: Color(0xFF4CAF7D),
                    ),
                  );
                },
                icon: const Icon(Icons.share_outlined),
                label: const Text('Compartilhar esta vaga'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4CAF7D),
                  side: const BorderSide(color: Color(0xFF4CAF7D)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class VoluntariadoProvider {
  Object? buscarPorId(String vagaId) {}
  
  void toggleInscricao(String vagaId) {}
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF4CAF7D), size: 22),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF888780))),
            Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
