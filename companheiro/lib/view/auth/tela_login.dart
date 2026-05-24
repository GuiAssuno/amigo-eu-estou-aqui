import 'package:companheiro/model/modelos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'esqueceu_senha.dart';
import 'cadastro.dart';
import '/view/home/home.dart';
import '/controller/auth_controle.dart';
import '/controller/tema_controle.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});
  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final emailController = TextEditingController();    // controlador do campo do email
  final passwordController = TextEditingController(); // controlador do campo da senha
  final _formKey = GlobalKey<FormState>();    //chave para o formulário
  final bool _carregando = false; // varivel para indicar se o login está em processo de carregamento
  bool _ocultarSenha = true; // variavel para ocultar a senha, 
  int _opcaoSelecionada = 0; // para guardar a opção selecionada: 0 para pessoa, 1 para ONG
  

  @override
  void dispose() { // função para limpar os campos de email e senha
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
// =====================================================================================================================
// ==================================================    REALIZAR LOGIN    =============================================
// =====================================================================================================================
  Future<void> entrar() async { 

    final controller = Provider.of<AuthController>(context, listen: false);
    final temaController = context.read<TemaController>();
    bool confirmacao;

    confirmacao = await controller.fazarLogin( // chama a função de login do controlador de autenticação
      emailController.text, 
      passwordController.text);

    // Como usamos "await", verificamos se a tela ainda está aberta antes de usar o 'context'
    if (!mounted) return;

    if (confirmacao) { // se o login for bem-sucedido
      final user = controller.usuarioLogado;

      bool vOng = (user is Ong);
      temaController.setProfileType(OngProfile: vOng);
      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Home()), // navega para a tela principal do aplicativo
      );
    } else { // se não
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar( //exibe uma mensagem de erro
          content: Text(controller.erro ?? 'Erro ao realizar login.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  
//==================   CONSTRUÇÃO DA TELA    ======================================================
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFE7DFD5),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column( // Coluna Principal
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
//=================================================================================================
//=======================================     COLUNA DO ITEM    ===================================
//=================================================================================================        
          Column(           // Coluna do icone
            children: [  
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(   // Decoração da caixa do icone
                  color: const Color(0xFF84A9AC),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(104, 64, 82, 83),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                
                child: Column(  //Coluna dentro do container para o icone
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SvgPicture.asset('assets/logo.svg'),
                    Icon(Icons.volunteer_activism, color: Color(0xFFE7DFD5), size: 44),
                  ],
                ),
              ),
                
              const SizedBox(width: 20), // spaço entre a caixa do icone e o nome
                
              const Text( 'Companheiro',
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF204051),
                ),
              ),
            ],
          ), 

//=================================================================================================
//================================     LINHA DA OPÇÃO DE LOGIN     ================================
//==================================      PESSOA   |   ONGs       =================================
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoSlidingSegmentedControl<int>(
                groupValue: _opcaoSelecionada,        // Guarda o valor selecionado
                thumbColor: Color(0xFF84A9AC),      // Cor do selecionado
                backgroundColor: Color(0xFF3B6978), // Cor de fundo da barra
                children: const {
    // Opção 0
                  0: Padding(  
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('Pessoa',
                      style: TextStyle(
                        fontSize: 12,
                        shadows: [
                          Shadow( 
                            offset: Offset(1, 1), 
                            blurRadius: 1,
                            color: Color(0XFF000000),
                          )
                        ],
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFE7DFD5),
                      ),
                    ),
                  ),
    // Opção 1                  
                  1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('ONGs',
                      style: TextStyle(
                        fontSize: 12,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Color(0XFF000000),
                          )
                        ],
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFE7DFD5),
                      ),
                    ),
                  ),
                },
                onValueChanged: (int? value) {
                  setState( () { _opcaoSelecionada = value!; } );
                },
              ),
            ],
          ),

//=========================================================================================
//==============================   COLUNA DAS CAIXA DE TEXTO   ============================
//=========================================================================================
            Form( key: _formKey,
              child: Column( 
                children: [
// ____________________________________________E-mail_________________________________________
                  TextFormField( 
                    controller: emailController,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),

                    validator: (email) {
                      if (email == null || email.isEmpty) return 'Informe seu e-mail.';
                      final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!regex.hasMatch(email)) return 'E-mail inválido.';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
//____________________________________________Senha _________________________________________               
                  TextFormField(                              
                    controller: passwordController,
                    obscureText: _ocultarSenha,
                    style: TextStyle(fontSize: 14),

                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: Icon(_ocultarSenha ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => _ocultarSenha = !_ocultarSenha),
                        ),
                    ),

                    validator: (senha) {
                      if (senha == null || senha.isEmpty) return 'Informe sua senha.';
                      return null;
                  },
                  ),

//=========================================================================================
//=============================  LINHA CADASTRAR ESQUECEU SENHA   =========================
//=========================================================================================                      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
//_______________________________________________Cadastrar___________________________________                       
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => TelaCadastrar(tipoUser: _opcaoSelecionada )),
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(color: Color(0xFF204051)),
                          ),
                        ),
                      ),
//___________________________________________Esqueceu Senha_________________________________  
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const TelaEsqueceuSenha()),
                          ),
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(color: Color(0xFF204051)),
                          ),
                        ),
                      ),
//-----------------------------------------------------------------------------------------
                    ],
                  ),
                ],
              ),
            ),
//=========================================================================================
//===================================      BOTÃO ENTRAR      ==============================
//=========================================================================================    
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle( backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 110, 168, 173)), ), 
          onPressed: _carregando ? null : entrar,// () => Navigator.of(context).pushReplacement( // TROCAR PARA COLOCAR VERIFICAR SENHA
          //   MaterialPageRoute(builder: (_) => const Home()),
          // ),

          //para trocar o texto do entrar para uma rodinha de carregamento
          child: _carregando
//______________________________________Circulo do Carregando_______________________________          
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(color: Color(0xff84A9AC), strokeWidth: 2),
            )
//________________________________________Esqueceu Senha____________________________________                
          : const Text('Entrar', 
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow( 
                    offset: Offset(0.5, 1), 
                    blurRadius: 1,
                    color: Color(0XFF000000),
                  )
                ],
              )
            ),
        ),
      ),

          ],
        ),
      ),
    );
  }
}

