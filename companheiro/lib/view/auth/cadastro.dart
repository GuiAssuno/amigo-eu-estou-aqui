import 'package:companheiro/controller/tema_controle.dart';
import 'package:companheiro/model/modelos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/controller/auth_controle.dart';

class TelaCadastrar extends StatefulWidget {
  final int tipoUser; // 0 para voluntário, 1 para ONG
  const TelaCadastrar({super.key, required this.tipoUser });

  @override
  State<TelaCadastrar> createState() => _TelaCadastrarState();
}

class _TelaCadastrarState extends State<TelaCadastrar> {
  final formKey = GlobalKey<FormState>();       // chave global para o formulário
  final cnpjController = TextEditingController();     // controlador do campo CNPJ
  final nomeController = TextEditingController();     // controlador do campo nome
  final emailController = TextEditingController();    // controlador do campo e-mail
  final telefoneController = TextEditingController(); // controlador do campo telefone
  final senhaController = TextEditingController();    // controlador do campo senha
  final confirmController = TextEditingController();  // controlador do campo confirmação de senha
  bool senhaOculta = true;   // variável para controlar o olhinho da senha
  bool confirmOculta = true; // variável para controlar o olhinho da confirmação de senha
  bool carregando = false;   // variável para controlar o estado de carregamento

  @override
  void dispose() { // limpa os campos de texto quando a tela for descartada
    emailController.dispose(); 
    senhaController.dispose();
    confirmController.dispose();
    cnpjController.dispose();
    nomeController.dispose();
    telefoneController.dispose();
    super.dispose();
  }

  Future<void> cadastrar() async {
    if (!formKey.currentState!.validate()) return; // validação do formulário
    
    setState(() => carregando = true); // inicia o estado de carregamento
    
    // Chama o Controller e passa os parametros de texto
    final controller = Provider.of<AuthController>(context, listen: false);
    bool sucesso = false;
    sucesso = await controller.cadastrar(
      cnpj: widget.tipoUser == 1 ? cnpjController.text : null, // cnpj se for ONG
      nome: nomeController.text,                // nome do usuário
      email: emailController.text,              // e-mail do usuário
      telefone: telefoneController.text,        // telefone do usuário
      senha: senhaController.text,              // senha do usuário
      confirmacaoSenha: confirmController.text, // confirmação de senha do usuário
    );

    setState(() => carregando = false); // finaliza o estado de carregamento
    if (!mounted) return; // verifica o widget

    // Se deu certo, vai pra Home ou volta pro Login
   if (sucesso) {
      final user = controller.usuarioLogado;
      bool vOng = (user is Ong);
      
      context.read<TemaController>().setProfileType(OngProfile: vOng);

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro realizado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Mostra o   na tela (ex: "Email já cadastrado")
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(controller.erro ?? 'Erro no cadastro'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFE7DFD5),
      appBar: AppBar(
        title: const Text('Criar conta'),
        backgroundColor: const Color(0xFF84A9AC),
        foregroundColor: Colors.white,
      ),

      
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const Row(
                      children: [
                        Text(
                          'Crie sua conta',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

//=================================================================================================
//==============================   COLUNA DAS CAIXA DE TEXTO   ====================================
//=================================================================================================
                    Column(
                      children: [
// _______________________________________________CNPJ_____________________________________________
                        Visibility(
                          visible: widget.tipoUser == 1,
                          child: TextFormField(               
                            controller: cnpjController,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              labelText: 'CNPJ',
                              prefixIcon: Icon(Icons.maps_home_work_outlined),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
// ______________________________________________NOME______________________________________________        
                        TextFormField(
                          controller: nomeController,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Nome completo *',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Informe seu nome.' : null,
                        ),
                        const SizedBox(height: 14),
// ____________________________________________E-MAIL______________________________________________
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'E-mail *',
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
                        const SizedBox(height: 14),
// ___________________________________________TELEFONE_____________________________________________
                        TextFormField(
                          controller: telefoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Telefone *',
                            prefixIcon: Icon(Icons.phone_outlined),
                            border: OutlineInputBorder(),
                            hintText: '(00) 00000-0000',
                          ),
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) return 'Informe seu telefone.';
                            final telefoneRegex = RegExp(r'^\(?\d{2}\)?\s?9?\d{4}-?\d{4}$');
                            if (!telefoneRegex.hasMatch(v)) {
                              return 'Telefone/Celular inválido.';
                            }
                          }
                        ),
                        const SizedBox(height: 14),
// _____________________________________________SENHA______________________________________________
                        TextFormField(
                          controller: senhaController,
                          obscureText: senhaOculta,
                          decoration: InputDecoration(
                            labelText: 'Senha *',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(senhaOculta ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => senhaOculta = !senhaOculta),
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Informe uma senha.';
                            if (v.length < 6) return 'Mínimo 6 caracteres.';
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
// _________________________________________CONFIRMAR SENHA________________________________________
                        TextFormField(
                          controller: confirmController,
                          obscureText: confirmOculta,
                          decoration: InputDecoration(
                            labelText: 'Confirmar senha *',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(confirmOculta ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => confirmOculta = !confirmOculta),
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Confirme sua senha.';
                            if (v != senhaController.text) return 'As senhas não coincidem.';
                            return null;
                          },
                        ),
                        //const SizedBox(height: 170),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

//=================================================================================================
//===================================      BOTÃO CRIAR CONTA      =================================
//=================================================================================================
          Container(
            padding: const EdgeInsets.all(24), // Dá um respiro ao redor dos botões
            decoration: const BoxDecoration(
              color: Color(0xFFE7DFD5), // Mesma cor do fundo da tela para ficar invisível
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle( backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 110, 168, 173)), ), 
                    onPressed: carregando ? null : cadastrar,
                    child: carregando
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Color(0xff84A9AC), strokeWidth: 2),
                          )
                        : const Text(
                          'Criar conta', 
                          style: TextStyle(
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
                
//=================================================================================================
//====================================      JA TENHO CONTA     ====================================
//=================================================================================================
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Já tenho conta → Entrar',
                        style: TextStyle(color: Color(0xFF204051), fontSize: 13)),
                  ),
                ),
              ],
            ),
//------------------------------------------------------------------------------------------------
          ),

        ]
      ),
    );
  }
}
