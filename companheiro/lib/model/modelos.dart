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

class Vaga {
  final String id;
  final String titulo;
  final String ong;
  final String descricao;
  final String area;
  final String cidade;
  final String disponibilidade;
  final int vagasDisponiveis;
  bool inscrito;

  Vaga({
    required this.id,
    required this.titulo,
    required this.ong,
    required this.descricao,
    required this.area,
    required this.cidade,
    required this.disponibilidade,
    required this.vagasDisponiveis,
    this.inscrito = false,
  });
}
