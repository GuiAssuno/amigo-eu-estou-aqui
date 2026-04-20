import '/model/modelos.dart';

class ListaAnimais {

  Future<List<Animal>> buscarAnimais() async {
    return [
      Animal(
        id: '1',
        nome: 'Lola',
        raca: 'Pastor-Alemão/Rottweiler',
        descricao: 'Dócil, brincalhona e adora comer.',
        especie: 'Cão', 
        idade: '3 anos', 
        sexo: 'Fêmea', 
        cidade: 'Ribeirão Preto = SP',
        fotos: [
          'assets/mock/lola/lola.png',
          'assets/mock/lola/lola2.png',
          'assets/mock/lola/lola3.png', 
        ], 
      ),
      Animal(
        id: '2',
        nome: 'Linguinha',
        raca: 'Dachshund',
        descricao: 'Gosta de ficar perto de pessoas, otima companheira',
        especie: 'Cão', 
        idade: '8 anos', 
        sexo: 'Fêmia', 
        cidade: 'Ribeirão Preto - SP',
        fotos: [
          'assets/mock/linguinha/linguinha.png',
          'assets/mock/linguinha/linguinha2.png',
          'assets/mock/linguinha/linguinha3.png', 
        ], 
      ),
      Animal(
        id: '3',
        nome: 'Nino',
        especie: 'Gato',
        raca: 'Bombaim',
        idade: '4 meses',
        sexo: 'Macho',
        descricao: 'Nino é um gatinho dócil e curioso. Gosta de colo e ronrona muito. Vermifugado e vacinado.',
        cidade: 'Sertãozinho - SP',
        fotos: [
          'assets/mock/nino/nino.png',
        ], 
      ),

      Animal(
        id: '4',
        nome: 'Luna',
        especie: 'Gato',
        raca: 'Persa mix',
        idade: '7 anos',
        sexo: 'Fêmea',
        descricao: 'Luna é fofa e brincalhão. Adora brincar com bolinhas e é muito afetiva. vacina em dia.',
        cidade: 'Ribeirão Preto - SP',
        fotos: [
          'assets/mock/luna/luna.png',
          'assets/mock/luna/luna2.png',
        ], 
      ),
      Animal(
        id: '5',
        nome: 'Carolina',
        especie: 'Cão',
        raca: 'Beagle Bicolor',
        idade: '10 anos',
        sexo: 'Fêmea',
        descricao: 'Carolina foi resgatado de maus-tratos. Após muito amor e cuidado, se tornou um cão dócil e companheira. Castrada e vacinada.',
        cidade: 'Ribeirão Preto - SP',
        fotos: [
          'assets/mock/carolina/carolina.png',
          'assets/mock/carolina/carolina2.png',
        ], 
      ),
      Animal(
        id: '6',
        nome: 'Mimi',
        especie: 'Gato',
        raca: 'Angorá mix',
        idade: '5 anos',
        sexo: 'Fêmea',
        descricao: 'Mimi é independente mas muito carinhosa quando quer. Ótima companhia para quem passa o dia em casa.',
        cidade: 'Franca - SP',
        fotos: [
          'assets/mock/mimi/mimi.png',
          'assets/mock/mimi/mimi2.png',
          'assets/mock/mimi/mimi3.png', 
        ], 
      ),
    ];
  }
}