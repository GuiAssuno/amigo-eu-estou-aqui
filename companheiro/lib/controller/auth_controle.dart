import 'package:flutter/foundation.dart';
import '/model/autenticador.dart';

class AuthController extends ChangeNotifier{

   final Autenticador autenticador = Autenticador();

   String? get erro => autenticador.erro;

  Future<bool> fazarLogin(String email, String senha) async {
    return await autenticador.fazerLogin(email, senha);
  }

  Future<bool> esqueceuSenha(String email) async {
    return autenticador.recuperarSenha(email);
  }

  Future<bool> cadastrar({ required String nome, required String email, required String telefone, required String senha, required String confirmacaoSenha, String? cnpj}) async {
    return autenticador.cadastrar(
      cnpj: cnpj,
      nome: nome,
      email: email,
      telefone: telefone,
      senha: senha,
      confirmacaoSenha: confirmacaoSenha,
    );
  }
  
  void logout() { // realizar logout
    autenticador.usuarioLogado = null; // limpar usuário logado
    notifyListeners();
  }

}

login(context, email, senha) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: senha)
      .then((res) {
    sucesso(context, 'Usuário autenticado com sucesso.');
    Navigator.pushReplacementNamed(context, 'principal');
  }).catchError((e) {
    switch (e.code) {
      case 'invalid-email':
        erro(context, 'O formato do email é inválido.');  break;
      case 'user-not-found':
        erro(context, 'Usuário não encontrado.'); break;
      case 'wrong-password':
        erro(context, 'Senha incorreta.');        break;
      default:
        erro(context, e.code.toString());
    }
  });
}

criarConta(context, nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      //Armazenar informações adicionais no Firestore
      Fireba to find project root in current working directory.seFirestore.instance.collection('usuarios').add({
        "uid": res.user!.uid.toString(),
        "nome": nome,
      });
      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.'); break;
        case 'invalid-email':
          erro(context, 'O email é inválido.'); break;
        default:
          erro(context, e.code.toString());
      }
    });
  }
