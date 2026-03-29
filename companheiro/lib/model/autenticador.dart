import 'package:flutter/foundation.dart';
import '/model/modelos.dart';

class AuthProvider extends ChangeNotifier {
  Usuario? _usuarioLogado;
  final List<Usuario> _usuarios = [];
  String? _erro;

  Usuario? get usuarioLogado => _usuarioLogado;
  bool get estaLogado => _usuarioLogado != null;
  String? get erro => _erro;

  void limparErro() {
    _erro = null;
    notifyListeners();
  }

  bool login(String email, String senha) {
    _erro = null;
    if (email.isEmpty || senha.isEmpty) {
      _erro = 'Preencha todos os campos.';
      notifyListeners();
      return false;
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      _erro = 'E-mail inválido.';
      notifyListeners();
      return false;
    }
    // Usuário demo fixo
    if (email == 'demo@hub.com' && senha == '123456') {
      _usuarioLogado = Usuario(
        id: '0',
        nome: 'Usuário Demo',
        email: email,
        telefone: '(16) 99999-0000',
        senha: senha,
      );
      notifyListeners();
      return true;
    }
    final found = _usuarios.firstWhere(
      (u) => u.email == email && u.senha == senha,
      orElse: () => Usuario(id: '', nome: '', email: '', telefone: '', senha: ''),
    );
    if (found.id.isEmpty) {
      _erro = 'E-mail ou senha incorretos.';
      notifyListeners();
      return false;
    }
    _usuarioLogado = found;
    notifyListeners();
    return true;
  }

  bool cadastrar({
    required String nome,
    required String email,
    required String telefone,
    required String senha,
    required String confirmacaoSenha,
  }) {
    _erro = null;
    if (nome.isEmpty || email.isEmpty || telefone.isEmpty || senha.isEmpty || confirmacaoSenha.isEmpty) {
      _erro = 'Preencha todos os campos obrigatórios.';
      notifyListeners();
      return false;
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      _erro = 'E-mail inválido.';
      notifyListeners();
      return false;
    }
    if (senha != confirmacaoSenha) {
      _erro = 'As senhas não coincidem.';
      notifyListeners();
      return false;
    }
    final existente = _usuarios.any((u) => u.email == email);
    if (existente) {
      _erro = 'E-mail já cadastrado.';
      notifyListeners();
      return false;
    }
    final novoUsuario = Usuario(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nome: nome,
      email: email,
      telefone: telefone,
      senha: senha,
    );
    _usuarios.add(novoUsuario);
    _usuarioLogado = novoUsuario;
    notifyListeners();
    return true;
  }

  bool recuperarSenha(String email) {
    _erro = null;
    if (email.isEmpty) {
      _erro = 'Preencha o campo de e-mail.';
      notifyListeners();
      return false;
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      _erro = 'E-mail inválido.';
      notifyListeners();
      return false;
    }
    final existe = _usuarios.any((u) => u.email == email) || email == 'demo@hub.com';
    if (!existe) {
      _erro = 'E-mail não encontrado.';
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;
  }

  void logout() {
    _usuarioLogado = null;
    notifyListeners();
  }
}
