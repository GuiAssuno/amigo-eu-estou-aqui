import 'package:companheiro/model/modelos.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/model/autenticador.dart';

class AuthController extends ChangeNotifier{

   final FirebaseAuth _auth = FirebaseAuth.instance;
   final Autenticador autenticador = Autenticador();

   String? get erro => autenticador.erro;

  Future<bool> fazarLogin(String email, String senha) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: senha);

    erro = null;
    notifyListeners();
    return true;
    }

    on FirebaseAuthException catch (e){
      erro = e.message;
      notifyListeners();
      return false;
    }
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
  
  Future<void> logout() async { // realizar logout
    await autenticador.logout();
    notifyListeners();
  }
}