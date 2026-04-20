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