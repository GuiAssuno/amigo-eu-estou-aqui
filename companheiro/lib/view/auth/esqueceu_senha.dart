import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/controller/auth_controle.dart';

class TelaEsqueceuSenha extends StatefulWidget {
  const TelaEsqueceuSenha({super.key});

  @override
  State<TelaEsqueceuSenha> createState() => _TelaEsqueceuSenhaState();
}

class _TelaEsqueceuSenhaState extends State<TelaEsqueceuSenha> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool carregando = false;
  bool enviado = false;


Future<void> recuperar() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => carregando = true);

    final controller = Provider.of<AuthController>(context, listen: false);
    bool sucesso = false;
    
    sucesso = await controller.esqueceuSenha(emailController.text);

    setState(() => carregando = false);

    if (sucesso) {
      // Muda a tela para aquele seu Widget de sucesso
      setState(() => enviado = true); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(controller.erro ?? 'Erro ao recuperar senha')),
      );
    }
  }

  @override
  void dispose() {// função para limpar o campo de email
    super.dispose(); 
    emailController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7DFD5),
      appBar: AppBar(
        title: const Text('Recuperar senha'),
        backgroundColor: const Color(0xFF84A9AC),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: enviado ? buildSucesso() : buildFormulario(),
        ),
      ),
    );
  }

  Widget buildFormulario() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Icon(Icons.lock_reset, size: 70, color: Color(0xFF84A9AC)),
          const SizedBox(height: 20),
          const Text(
            'Esqueceu sua senha?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Informe o e-mail cadastrado e enviaremos as instruções para redefinir sua senha.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
          ),
          const SizedBox(height: 32),
          
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'E-mail cadastrado',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Informe seu e-mail.';
              final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!regex.hasMatch(v)) return 'E-mail inválido.';
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle( backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 110, 168, 173)), ), 
              onPressed: carregando ? null : recuperar,
              child: carregando
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Color(0xff84A9AC), strokeWidth: 2),
                    )
                  : const Text('Recuperar senha', style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow( 
                                  offset: Offset(1, 0.5), 
                                  blurRadius: 1,
                                  color: Color(0XFF000000),
                                )
                              ],
                            )
                          ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Voltar ao login', style: TextStyle(color: Color(0xFF204051))),
          ),
        ],
      ),
    );
  }

  Widget buildSucesso() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.mark_email_read_outlined, size: 80, color: Color(0xFF4CAF7D)),
        const SizedBox(height: 24),
        
        const Text(
          'E-mail enviado!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
        ),
        const SizedBox(height: 12),
        Text(
          'Enviamos instruções de redefinição de senha para:\n${emailController.text.trim()}',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFF888780), fontSize: 14),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Voltar ao login'),
          ),
        ),
      ],
    );
  }
}
