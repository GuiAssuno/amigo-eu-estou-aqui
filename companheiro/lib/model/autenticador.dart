import 'package:flutter/foundation.dart';
import '/model/modelos.dart';

// gerenciador de autenticação
class Autenticador extends ChangeNotifier { 
  final List<Usuario> usuarios = []; // banco de usuários simulado, todos os usuários cadastrados ficam aqui
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
    if (email.isEmpty || senha.isEmpty) { // campos vazios
      msgErro = 'Preencha todos os campos.'; // mensagem de erro para campos vazios
      notifyListeners(); // notificar ouvintes
      return false; // login falhou
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$'); // expressão regular para validar e-mail
    if (!emailRegex.hasMatch(email)) {
      msgErro = 'E-mail inválido.'; // mensagem de erro para e-mail inválido
      notifyListeners();  // notificar ouvintes
      return false;
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

    final buscaUsuario = usuarios.firstWhere( // encontrar usuário
      (user) => user.email == email && user.senha == senha, // condição de busca
      orElse: () => Usuario(id: '', nome: '', email: '', telefone: '', senha: ''), // valor padrão se não encontrado
    );

    if (buscaUsuario.id.isEmpty) { // usuário não encontrado
      msgErro = 'E-mail ou senha incorretos.';
      notifyListeners();
      return false;
    }
    usuarioLogado = buscaUsuario;
    notifyListeners();
    return true;
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

    // se os campos obrigatórios não estão preenchidos
    if (nome.isEmpty || email.isEmpty || telefone.isEmpty || senha.isEmpty || confirmacaoSenha.isEmpty) {
      msgErro = 'Preencha todos os campos obrigatórios.';
      notifyListeners();
      return false;
    }
//____________________________________________________email_______________________________________
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$'); // expressão regular para validar e-mail
    if (!emailRegex.hasMatch(email)) {
      msgErro = 'E-mail inválido.';
      notifyListeners();
      return false;
    }

    final existente = usuarios.any((u) => u.email == email); // verificar se o e-mail já existe
    if (existente) {
      msgErro = 'E-mail já cadastrado.';
      notifyListeners();
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
//________________________________________________senhas iguais____________________________________
    if (senha != confirmacaoSenha) { 
      msgErro = 'As senhas não coincidem.';
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
    final existe = usuarios.any((u) => u.email == email) || email == 'gui@teste.com'; // verificar se o e-mail existe
    if (!existe) {
      msgErro = 'E-mail não encontrado.';
      notifyListeners();
      return false;
    }
    notifyListeners(); // notificar ouvintes
    return true;
  }
  

}
