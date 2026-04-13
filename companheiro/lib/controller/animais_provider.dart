import 'package:flutter/foundation.dart';
import '../models/models.dart';

class AnimaisProvider extends ChangeNotifier {
  final List<Animal> _animais = [
    Animal(
      id: '1',
      nome: 'Biscuit',
      especie: 'Cão',
      raca: 'Vira-lata',
      idade: '2 anos',
      sexo: 'Macho',
      descricao: 'Biscuit é um cãozinho muito carinhoso e brincalhão. Adora crianças e se dá bem com outros animais. Foi resgatado da rua e já está vacinado e castrado.',
      ong: 'ONG Patinhas Felizes',
      cidade: 'Ribeirão Preto - SP',
      imageUrl: 'dog',
    ),
    Animal(
      id: '2',
      nome: 'Mel',
      especie: 'Gato',
      raca: 'Siamês',
      idade: '1 ano',
      sexo: 'Fêmea',
      descricao: 'Mel é uma gatinha dócil e curiosa. Gosta de colo e ronrona muito. Ideal para apartamento. Vermifugada e vacinada.',
      ong: 'Lar dos Bigodes',
      cidade: 'Ribeirão Preto - SP',
      imageUrl: 'cat',
    ),
    Animal(
      id: '3',
      nome: 'Thor',
      especie: 'Cão',
      raca: 'Labrador mix',
      idade: '3 anos',
      sexo: 'Macho',
      descricao: 'Thor é grande, mas tem coração maior ainda! Adestrado, obediente e super leal. Precisa de espaço para correr.',
      ong: 'ONG Patinhas Felizes',
      cidade: 'Sertãozinho - SP',
      imageUrl: 'dog',
    ),
    Animal(
      id: '4',
      nome: 'Luna',
      especie: 'Gato',
      raca: 'Persa mix',
      idade: '4 meses',
      sexo: 'Fêmea',
      descricao: 'Luna é um filhote fofo e brincalhão. Adora brincar com bolinhas e é muito afetiva. Primeira vacina em dia.',
      ong: 'Lar dos Bigodes',
      cidade: 'Ribeirão Preto - SP',
      imageUrl: 'cat',
    ),
    Animal(
      id: '5',
      nome: 'Rex',
      especie: 'Cão',
      raca: 'Pitbull mix',
      idade: '5 anos',
      sexo: 'Macho',
      descricao: 'Rex foi resgatado de maus-tratos. Após muito amor e cuidado, se tornou um cão dócil e companheiro. Castrado e vacinado.',
      ong: 'Resgate Animal RP',
      cidade: 'Ribeirão Preto - SP',
      imageUrl: 'dog',
    ),
    Animal(
      id: '6',
      nome: 'Mimi',
      especie: 'Gato',
      raca: 'Angorá mix',
      idade: '2 anos',
      sexo: 'Fêmea',
      descricao: 'Mimi é independente mas muito carinhosa quando quer. Ótima companhia para quem passa o dia em casa.',
      ong: 'Lar dos Bigodes',
      cidade: 'Franca - SP',
      imageUrl: 'cat',
    ),
  ];

  List<Animal> get animais => List.unmodifiable(_animais);

  List<Animal> get favoritos => _animais.where((a) => a.favorito).toList();

  List<Animal> filtrar({String? especie, String? cidade}) {
    return _animais.where((a) {
      final filtroEspecie = especie == null || especie == 'Todos' || a.especie == especie;
      final filtroCidade = cidade == null || cidade.isEmpty || a.cidade.toLowerCase().contains(cidade.toLowerCase());
      return filtroEspecie && filtroCidade;
    }).toList();
  }

  void toggleFavorito(String id) {
    final index = _animais.indexWhere((a) => a.id == id);
    if (index != -1) {
      _animais[index].favorito = !_animais[index].favorito;
      notifyListeners();
    }
  }

  Animal? buscarPorId(String id) {
    try {
      return _animais.firstWhere((a) => a.id == id);
    } catch (_) {
      return null;
    }
  }
}
