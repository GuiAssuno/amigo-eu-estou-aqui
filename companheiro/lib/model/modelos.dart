// Classes para registrar informações dos usuarios do aplicativo
class Usuario {       
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String senha;

  Usuario({ 
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.senha,
  });
}

// Classes para registrar informações das ONGs do aplicativo
class Ong extends Usuario {       
  final String cnpj;

  Ong({ 
    required super.id,
    required super.nome,
    required super.email,
    required super.telefone,
    required super.senha,
    required this.cnpj,
  });
}

// Classe para registrar informações dos animais
class Animal { 
  final String id;
  final String nome;
  final String especie;
  final String raca;
  final String idade;
  final String sexo;
  final String descricao;
  final String cidade;
  final List<String> fotos;

  Animal({ 
    required this.id,
    required this.nome,
    required this.especie,
    required this.raca,
    required this.idade,
    required this.sexo,
    required this.descricao,
    required this.cidade,
    required this.fotos,
  });
}

// Classe para registrar informações das vagas de voluntariado
class Vaga { 
  final String id;
  final String titulo;
  final String ong;
  final String descricao;
  final String tipo;
  final String cidade;
  final String disponibilidade;
  final int vagasDisponiveis;
  bool inscrito;

  Vaga({ 
    required this.id,
    required this.titulo,
    required this.ong,
    required this.descricao,
    required this.tipo,
    required this.cidade,
    required this.disponibilidade,
    required this.vagasDisponiveis,
    this.inscrito = false,
  });
}

class Sos {
  final String id;
  final String uid;
  final String titulo;
  final String descricao;
  final String cidade;

  Sos({
    required this.id,
    required this.uid,
    required this.titulo,
    required this.descricao,
    required this.cidade,
  });
}