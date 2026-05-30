import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/controller/auth_controle.dart';
import '/model/modelos.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para edição
  late TextEditingController _nomeController;
  late TextEditingController _telefoneController;
  late TextEditingController _cnpjController;

  bool _estaEditando = false;
  bool _salvando = false;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<AuthController>(context, listen: false).usuarioLogado;
    
    // Inicializa com os dados atuais do usuário
    _nomeController = TextEditingController(text: user?.nome ?? '');
    _telefoneController = TextEditingController(text: user?.telefone ?? '');
    _cnpjController = TextEditingController(text: (user is Ong) ? user.cnpj : '');
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _cnpjController.dispose();
    super.dispose();
  }

  // Função para Salvar Alterações (RF004)
  Future<void> _salvarAlteracoes() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _salvando = true);
    
    final authController = Provider.of<AuthController>(context, listen: false);
    final user = authController.usuarioLogado;

    try {
      String colecao = (user is Ong) ? 'ongs' : 'usuarios';
      
      // Atualiza no Firestore
      await FirebaseFirestore.instance
          .collection(colecao)
          .doc(user?.id)
          .update({
        'nome': _nomeController.text.trim(),
        'telefone': _telefoneController.text.trim(),
        if (user is Ong) 'cnpj': _cnpjController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados atualizados com sucesso! 🐾'), backgroundColor: Colors.green),
      );
      
      setState(() => _estaEditando = false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar: $e'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _salvando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context).usuarioLogado;

    bool ehOng = user is Ong;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EE),
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        actions: [
          IconButton(
            icon: Icon(_estaEditando ? Icons.close : Icons.edit),
            onPressed: () => setState(() => _estaEditando = !_estaEditando),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Cabeçalho do Perfil
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: const Color(0xFF84A9AC),
                      child: Icon(ehOng ? Icons.home_work : Icons.person, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user?.nome ?? 'Usuário',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
                    ),
                    Text(
                      ehOng ? 'Organização Solidária' : 'Voluntário Ativo',
                      style: const TextStyle(color: Color(0xFF888780)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Campo: Nome
              _buildField(
                label: ehOng ? 'Nome da ONG' : 'Nome Completo',
                controller: _nomeController,
                icon: Icons.badge_outlined,
                enabled: _estaEditando,
              ),

              // Campo: Telefone
              _buildField(
                label: 'Telefone de Contato',
                controller: _telefoneController,
                icon: Icons.phone_android_outlined,
                enabled: _estaEditando,
                keyboardType: TextInputType.phone,
              ),

              // Campo: CNPJ (Se for ONG)
              if (ehOng)
                _buildField(
                  label: 'CNPJ',
                  controller: _cnpjController,
                  icon: Icons.assignment_outlined,
                  enabled: _estaEditando,
                ),

              // Campo: Email (Sempre bloqueado por segurança/identidade)
              _buildField(
                label: 'E-mail (Login)',
                controller: TextEditingController(text: user?.email ?? ''),
                icon: Icons.email_outlined,
                enabled: false,
              ),

              const SizedBox(height: 40),

              // Botão de Salvar
              if (_estaEditando)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _salvando ? null : _salvarAlteracoes,
                    icon: _salvando 
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Icon(Icons.check),
                    label: const Text('SALVAR ALTERAÇÕES'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          style: TextStyle(color: enabled ? Colors.black : Colors.grey[600]),
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon, color: const Color(0xFFE8734A)),
            border: InputBorder.none,
          ),
          validator: (v) => (v == null || v.isEmpty) ? 'Campo obrigatório' : null,
        ),
      ),
    );
  }
}