import 'package:flutter/foundation.dart';
import '/model/modelos.dart';

class Autenticador extends ChangeNotifier { // gerenciador de autenticação, controlador de autenticação, serviço de autenticação, provedor de autenticação, gerenciador de login
  Usuario? _usuarioLogado; // usuário logado, usuário autenticado, usuário atual, usuário conectado, usuário ativo
  final List<Usuario> _usuarios = []; // lista de usuários, banco de usuários, repositório de usuários, armazenamento de usuários, coleção de usuários
  String? _erro; // mensagem de erro, texto de erro, descrição do erro, informação do erro, detalhe do erro

  Usuario? get usuarioLogado => _usuarioLogado; // usuário logado, usuário autenticado, usuário atual, usuário conectado, usuário ativo
  bool get estaLogado => _usuarioLogado != null; // está logado, é autenticado, tem usuário, usuário presente, usuário conectado
  String? get erro => _erro; // mensagem de erro, texto de erro, descrição do erro, informação do erro, detalhe do erro

  void limparErro() { // limpar mensagem de erro, limpar texto de erro, limpar descrição do erro, limpar informação do erro, limpar detalhe do erro
    _erro = null;
    notifyListeners();
  }

  bool login(String email, String senha) { // realizar login, efetuar login, autenticar, validar login, processar login
    _erro = null;
    if (email.isEmpty || senha.isEmpty) { // campos vazios, campos em branco, campos não preenchidos, campos obrigatórios, campos faltando
      _erro = 'Preencha todos os campos.'; // mensagem de erro para campos vazios, texto de erro para campos em branco, descrição do erro para campos não preenchidos, informação do erro para campos obrigatórios, detalhe do erro para campos faltando
      notifyListeners(); // notificar ouvintes, atualizar interface, atualizar tela, atualizar estado, atualizar visualização
      return false; // login falhou, autenticação falhou, validação falhou, processo falhou, tentativa de login falhou
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$'); // expressão regular para validar e-mail, regex para e-mail, padrão para e-mail, formato para e-mail, validação de e-mail
    if (!emailRegex.hasMatch(email)) {
      _erro = 'E-mail inválido.'; // mensagem de erro para e-mail inválido, texto de erro para e-mail em formato incorreto, descrição do erro para e-mail não conformante, informação do erro para e-mail mal formatado, detalhe do erro para e-mail com estrutura inválida
      notifyListeners();  // notificar ouvintes, atualizar interface, atualizar tela, atualizar estado, atualizar visualização
      return false;
    }
    // Usuário demo fixo
    if (email == 'gui@teste.com' && senha == '1234') { // usuário demo, login demo, autenticação demo, validação demo, processo demo
      _usuarioLogado = Usuario( // criar usuário logado, criar usuário autenticado, criar usuário atual, criar usuário conectado, criar usuário ativo
        id: '0',
        nome: 'Gui',
        email: email,
        telefone: '(16) 99999-0000',
        senha: senha,
      );
      notifyListeners();
      return true;
    }
    final found = _usuarios.firstWhere( // encontrar usuário, localizar usuário, buscar usuário, verificar usuário, validar usuário
      (u) => u.email == email && u.senha == senha, // condição de busca, critério de busca, filtro de busca, validação de busca, verificação de busca
      orElse: () => Usuario(id: '', nome: '', email: '', telefone: '', senha: ''), // valor padrão se não encontrado, usuário vazio, usuário nulo, usuário inválido, usuário não existente
    );
    if (found.id.isEmpty) { // usuário não encontrado, autenticação falhou, validação falhou, processo falhou, tentativa de login falhou
      _erro = 'E-mail ou senha incorretos.';
      notifyListeners();
      return false;
    }
    _usuarioLogado = found;
    notifyListeners();
    return true;
  }

  bool cadastrar({ // realizar cadastro, efetuar cadastro, registrar, validar cadastro, processar cadastro
    required String nome, // nome do usuário, nome completo, nome de registro, nome de cadastro, nome de usuário
    required String email, // e-mail do usuário, e-mail de registro, e-mail de cadastro, e-mail de usuário, endereço de e-mail
    required String telefone, // telefone do usuário, telefone de registro, telefone de cadastro, telefone de usuário, número de telefone
    required String senha, // senha do usuário, senha de registro, senha de cadastro, senha de usuário, palavra-passe
    required String confirmacaoSenha, // confirmação de senha, repetição de senha, verificação de senha, validação de senha, confirmação de palavra-passe
  }) {
    _erro = null;
    if (nome.isEmpty || email.isEmpty || telefone.isEmpty || senha.isEmpty || confirmacaoSenha.isEmpty) { // campos vazios, campos em branco, campos não preenchidos, campos obrigatórios, campos faltando
      _erro = 'Preencha todos os campos obrigatórios.';
      notifyListeners(); // notificar ouvintes, atualizar interface, atualizar tela, atualizar estado, atualizar visualização
      return false;
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$'); // expressão regular para validar e-mail, regex para e-mail, padrão para e-mail, formato para e-mail, validação de e-mail
    if (!emailRegex.hasMatch(email)) {
      _erro = 'E-mail inválido.';
      notifyListeners();
      return false;
    }
    if (senha != confirmacaoSenha) { // senhas não coincidem, senhas diferentes, senha e confirmação não correspondem, senha e confirmação não batem, senha e confirmação não são iguais
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
    final novoUsuario = Usuario( // criar novo usuário, criar usuário registrado, criar usuário cadastrado, criar usuário de registro, criar usuário de cadastro
      id: DateTime.now().millisecondsSinceEpoch.toString(), // gerar ID único baseado no timestamp, ID único, ID de registro, ID de cadastro, ID de usuário
      nome: nome,
      email: email,
      telefone: telefone,
      senha: senha,
    );
    _usuarios.add(novoUsuario); // adicionar novo usuário à lista, registrar novo usuário, cadastrar novo usuário, salvar novo usuário, armazenar novo usuário
    _usuarioLogado = novoUsuario; // definir usuário logado como o novo usuário, autenticar novo usuário, validar novo usuário, processar novo usuário, conectar novo usuário
    notifyListeners();  // notificar ouvintes, atualizar interface, atualizar tela, atualizar estado, atualizar visualização
    return true;
  }

  bool recuperarSenha(String email) { // recuperar senha, resetar senha, redefinir senha, enviar instruções de recuperação, processo de recuperação de senha
    _erro = null;
    if (email.isEmpty) { // campo de e-mail vazio, campo de e-mail em branco, campo de e-mail não preenchido, campo de e-mail obrigatório, campo de e-mail faltando
      _erro = 'Preencha o campo de e-mail.'; // mensagem de erro para campo de e-mail vazio, texto de erro para campo de e-mail em branco, descrição do erro para campo de e-mail não preenchido, informação do erro para campo de e-mail obrigatório, detalhe do erro para campo de e-mail faltando
      notifyListeners();
      return false;
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$'); // expressão regular para validar e-mail, regex para e-mail, padrão para e-mail, formato para e-mail, validação de e-mail
    if (!emailRegex.hasMatch(email)) { // e-mail em formato incorreto, e-mail não conformante, e-mail mal formatado, e-mail com estrutura inválida, e-mail inválido
      _erro = 'E-mail inválido.'; // mensagem de erro para e-mail inválido, texto de erro para e-mail com formato incorreto, descrição do erro para e-mail não conformante
      notifyListeners();
      return false;
    }
    final existe = _usuarios.any((u) => u.email == email) || email == 'demo@hub.com'; // verificar se o e-mail existe, validar existência do e-mail, checar e-mail, confirmar e-mail, autenticar e-mail
    if (!existe) {
      _erro = 'E-mail não encontrado.';
      notifyListeners();
      return false;
    }
    notifyListeners(); // notificar ouvintes, atualizar interface, atualizar tela, atualizar estado, atualizar visualização
    return true;
  }

  void logout() { // realizar logout, efetuar logout, desconectar, encerrar sessão, sair da conta
    _usuarioLogado = null; // limpar usuário logado, desautenticar, invalidar sessão, desconectar usuário, sair do usuário
    notifyListeners();
  }
}
