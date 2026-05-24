import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/model/modelos.dart';

// gerenciador de autenticação
class Autenticador extends ChangeNotifier { 
  final FirebaseAuth _auth = FirebaseAuth.instance;
   // banco de usuários simulado, todos os usuários cadastrados ficam aqui
  Usuario? usuarioLogado; // usuário logado, null se não houver nenhum usuário logado
  String? msgErro; // armazena o erro para no snackbar

  Usuario? get userlogado => usuarioLogado; // usuário logado
  String? get erro => msgErro; // mensagem de erro, texto de erro  
  bool get estaLogado => usuarioLogado != null; // está logado
  

  void limparErro() { // limpar mensagem de erro
    msgErro = null;
    notifyListeners();
  }

//=================================================================================================
//========================================      FAZ LOGIN      ====================================
//=================================================================================================
  Future<bool> fazerLogin(String email, String senha) async { // realizar login
    msgErro = null;

    try{
      await _auth.signInWithEmailAndPassword(email: email, password: senha);

      notifyListeners();
      return true;
    }

    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        msgErro = 'Usuário não encontrado';
      }
      else if (e.code == 'wrong-password') {
        msgErro = 'E-mail ou senha incorretos';
      }
      else if (e.code == 'invalid-email') {
        msgErro = 'E-mail ou senha incorretos';
      }
      else {
        msgErro = 'Erro ao fazer o login';
      }
    }

    if (email.isEmpty || senha.isEmpty) { // campos vazios
      msgErro = 'Preencha todos os campos.'; // mensagem de erro para campos vazios
      notifyListeners(); // notificar ouvintes
      return false; // login falhou
    }

    if (email == 'gui@teste.com' && senha == '1234') { // usuário demo
      usuarioLogado = Usuario( // criar usuário logado
        id: '0',
        nome: 'Gui',
        email: email,
        telefone: '(16) 99999-0000',
        senha: senha,
      );
      notifyListeners();
      return true;
    }
  }

//=================================================================================================
//====================================      CADASTRAR USUARIO     =================================
//=================================================================================================
  Future<bool> cadastrar({ String? cnpj,// só é obrigatório para ONGs
    required String nome,               // nome do usuário
    required String email,              // e-mail do usuário
    required String senha,              // senha do usuário
    required String telefone,           // telefone do usuário
    required String confirmacaoSenha,   // confirmação de senha,
  }) async {
    msgErro = null;

    //________________________________________________senhas iguais____________________________________
    if (senha != confirmacaoSenha) { 
      msgErro = 'As senhas não coincidem.';
      notifyListeners();
      return false;
    }

    //_________________________se os campos obrigatórios não estão preenchidos_________________________
    if (nome.isEmpty || email.isEmpty || telefone.isEmpty || senha.isEmpty || confirmacaoSenha.isEmpty) {
      msgErro = 'Preencha todos os campos obrigatórios.';
      notifyListeners();
      return false;
    }

    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      notifyListeners();
      return false;
    }
    on FirebaseAuthException catch (e) {

      //________________________________________________email__________________________________________
      if (e.code == 'email-already-in-use'){
        msgErro = 'E-mail já cadastrado';
      }
      else if (e.code == 'invalid-email'){
        msgErro = 'E-mail inválido';
      }
      //________________________________________________senha___________________________________________
      else if (e.code == 'weak-password'){
        msgErro = 'Senha fraca';
      }
      //_____________________________________________outros erros_______________________________________
      else {
        msgErro = 'Erro ao cadastrar';
      }

      return false;
    }
//_______________________________________________________cnpj______________________________________
    bool userOng =false;
    userOng = (cnpj != null && cnpj.isNotEmpty);
    if (userOng) {//                                expressão regular para validar CNPJ Alfanumérico
      final cnpjRegex = RegExp(r'^[A-Za-z0-9]{2}\.[A-Za-z0-9]{3}\.[A-Za-z0-9]{3}/[A-Za-z0-9]{4}-\d{2}$'); 
      if (!cnpjRegex.hasMatch(cnpj)) {
        msgErro = 'CNPJ inválido.';
        notifyListeners();
        return false;
      }    
//________________________________________________novo_usuario_____________________________________
//                                     usuário ONG
    final novaOng = Ong( 
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        cnpj: cnpj, 
        nome: nome,
        email: email,
        senha: senha,
        telefone: telefone,
      );
      usuarios.add(novaOng); 
      usuarioLogado = novaOng; 
    } else {
//                                    usuário comum
      final novoUsuario = Usuario( 
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nome: nome,
        email: email,
        senha: senha,
        telefone: telefone,
      );
      usuarios.add(novoUsuario); 
      usuarioLogado = novoUsuario; 
    }
    notifyListeners();  
    return true; 
  } 

//=================================================================================================
//=====================================      RECUPERAR SENHA     ==================================
//=================================================================================================
  Future<bool> recuperarSenha(String email) async { // recuperar senha
    msgErro = null;
    if (email.isEmpty) { // campo de e-mail vazio
      msgErro = 'Preencha o campo de e-mail.'; // mensagem de erro para campo de e-mail vazio
      notifyListeners();
      return false;
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$'); // expressão regular para validar e-mail
    if (!emailRegex.hasMatch(email)) { // se email em formato incorreto
      msgErro = 'E-mail inválido.'; 
      notifyListeners();
      return false;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      return false;
    }
    on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found'){
        msgErro = 'E-mail não cadastrado';
      }
      else {
        msgErro = 'Erro ao recuperar a senha';
      }

      notifyListeners();
      return false;
    }
  }
}

Future<void> logout() async {
  await _auth.signOut();
  notifyListeners();
}