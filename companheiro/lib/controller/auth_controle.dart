import 'package:companheiro/model/modelos.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/model/autenticador.dart';

class AuthController extends ChangeNotifier{

  final Autenticador autenticador = Autenticador();
  String? get erro => autenticador.erro;
  get usuarioLogado => autenticador.usuarioLogado;
  
  Future<bool> fazerLogin(String email, String senha) async {
    return autenticador.fazerLogin(email, senha);
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

  Future<void> criarSos({
    required String titulo,
    required String descricao,
    required String cidade,
  }) async {
    await autenticador.criarSos(
      titulo: titulo,
      descricao: descricao,
      cidade: cidade,
    );
  }

  Future<void> deletarSos(String sosId) async {
    await autenticador.deletarSos(sosId);
    notifyListeners();
  }

  String? validarUsuario({
    required String nome,
    required String email,
    required String telefone,
    String? senha,
    String? confirmacaoSenha,
    String? cnpj,
  }) {
    return autenticador.validarUsuario(
      nome: nome,
      email: email,
      telefone: telefone,
      senha: senha,
      confirmacaoSenha: confirmacaoSenha,
      cnpj: cnpj,
    );
  }
}