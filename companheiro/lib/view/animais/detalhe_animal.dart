import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DetalheAnimal extends StatelessWidget {
  const DetalheAnimal({super.key});

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title: Text('Voluntários'),
      ),
      body: Center(
        child: Text('detalhes animal'),
      ),
    );
  }
}
































































// class DetalheAnimalScreen extends StatelessWidget {
//   final String animalId;
//   const DetalheAnimalScreen({super.key, required this.animalId});

//   @override
//   Widget build(BuildContext context) {
//     final animal = context.watch<AnimaisProvider>().buscarPorId(animalId);

//     if (animal == null) {
//       return const Scaffold(body: Center(child: Text('Animal não encontrado.')));
//     }

//     return Scaffold(
//       backgroundColor: const Color(0xFFFDF6EE),
//       body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       expandedHeight: 260,
      //       pinned: true,
      //       backgroundColor: const Color(0xFFFAEEDA) ,
      //       foregroundColor: const Color(0xFF2C2C2A),
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Stack(
      //           fit: StackFit.expand,
      //           children: [
      //             Container(
      //               color: const Color(0xFFFAEEDA),
      //               child: Center(
      //                 child: Text('🐶',
      //                   style: const TextStyle(fontSize: 110),
      //                 ),
      //               ),
      //             ),
      //             Positioned(
      //               top: 16,
      //               right: 16,
      //               child: SafeArea(
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),

      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: const EdgeInsets.all(20),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Expanded(
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         animal.nome,
      //                         style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
      //                       ),
      //                       Text(
      //                         animal.raca,
      //                         style: const TextStyle(fontSize: 16, color: Color(0xFF888780)),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      //                   decoration: BoxDecoration(
      //                     color: const Color(0xFF4CAF7D).withOpacity(0.1),
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                   child: Text(
      //                     animal.especie,
      //                     style: const TextStyle(color: Color(0xFF4CAF7D), fontWeight: FontWeight.bold),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             const SizedBox(height: 20),

      //             Características
      //             Row(
      //               children: [
      //                 _InfoChip(icon: Icons.cake_outlined, label: animal.idade),
      //                 const SizedBox(width: 8),

      //                 const SizedBox(width: 8),
      //                 _InfoChip(icon: Icons.location_on_outlined, label: 'eeeeeeeee'),
      //               ],
      //             ),
      //             const SizedBox(height: 20),

      //             ONG
      //             Container(
      //               padding: const EdgeInsets.all(14),
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.circular(12),
      //                 border: Border.all(color: const Color(0xFFE0D5C8)),
      //               ),
      //               child: Row(
      //                 children: [
      //                   const Icon(Icons.home_outlined, color: Color(0xFFE8734A)),
      //                   const SizedBox(width: 10),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       const Text('Responsável pela adoção',
      //                           style: TextStyle(fontSize: 12, color: Color(0xFF888780))),
      //                       Text('Animal ong', style: const TextStyle(fontWeight: FontWeight.bold)),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(height: 20),

      //             const Text('Sobre mim', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //             const SizedBox(height: 8),
      //             Text(
      //               'Descrição do animal',
      //               style: const TextStyle(fontSize: 15, color: Color(0xFF5F5E5A), height: 1.6),
      //             ),
      //             const SizedBox(height: 32),

      //             Botão adotar
      //             SizedBox(
      //               width: double.infinity,
      //               child: ElevatedButton.icon(
      //                 onPressed: () {
      //                   showDialog(
      //                     context: context,
      //                     builder: (_) => AlertDialog(
      //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      //                       title: Text('Adotar '),
      //                       content: Text(
      //                         'Sua solicitação de adoção foi enviada para ! Eles entrarão em contato em breve. 🐾',
      //                       ),
      //                       actions: [
      //                         ElevatedButton(
      //                           onPressed: () => Navigator.pop(context),
      //                           child: const Text('Ótimo!'),
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 },
      //                 icon: const Icon(Icons.favorite),
      //                 label: Text('Quero adotar ${animal.nome}!'),
      //                 style: ElevatedButton.styleFrom(
      //                   padding: const EdgeInsets.symmetric(vertical: 16),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 12),
      //             SizedBox(
      //               width: double.infinity,
      //               child: OutlinedButton.icon(
      //                 onPressed: () {
      //                   ScaffoldMessenger.of(context).showSnackBar(
      //                     const SnackBar(
      //                       content: Text('Contato da ONG copiado! 📋'),
      //                       backgroundColor: Color(0xFF4CAF7D),
      //                     ),
      //                   );
      //                 },
      //                 icon: const Icon(Icons.phone_outlined),
      //                 label: const Text('Entrar em contato com a ONG'),
      //                 style: OutlinedButton.styleFrom(
      //                   foregroundColor: const Color(0xFFE8734A),
      //                   side: const BorderSide(color: Color(0xFFE8734A)),
      //                   padding: const EdgeInsets.symmetric(vertical: 14),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 24),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
//     );
//   }
// }

// class _InfoChip extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   const _InfoChip({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE8734A).withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 14, color: const Color(0xFFE8734A)),
//           const SizedBox(width: 4),
//           Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFFE8734A), fontWeight: FontWeight.w500)),
//         ],
//       ),
//     );
//   }
// }








// class Animal {
//   final String id;
//   final String nome;
//   final String especie;
//   final String raca;
//   final String idade;
//   final String sexo;
//   final String descricao;
//   final String ong;
//   final String cidade;
//   final String imageUrl;
//   bool favorito;

//   Animal({
//     required this.id,
//     required this.nome,
//     required this.especie,
//     required this.raca,
//     required this.idade,
//     required this.sexo,
//     required this.descricao,
//     required this.ong,
//     required this.cidade,
//     required this.imageUrl,
//     this.favorito = false,
//   });
// }





// class AnimaisProvider extends ChangeNotifier {
//   final List<Animal> _animais = [
//     Animal(
//       id: '1',
//       nome: 'Biscuit',
//       especie: 'Cão',
//       raca: 'Vira-lata',
//       idade: '2 anos',
//       sexo: 'Macho',
//       descricao: 'Biscuit é um cãozinho muito carinhoso e brincalhão. Adora crianças e se dá bem com outros animais. Foi resgatado da rua e já está vacinado e castrado.',
//       ong: 'ONG Patinhas Felizes',
//       cidade: 'Ribeirão Preto - SP',
//       imageUrl: 'dog',
//     ),
//     Animal(
//       id: '2',
//       nome: 'Mel',
//       especie: 'Gato',
//       raca: 'Siamês',
//       idade: '1 ano',
//       sexo: 'Fêmea',
//       descricao: 'Mel é uma gatinha dócil e curiosa. Gosta de colo e ronrona muito. Ideal para apartamento. Vermifugada e vacinada.',
//       ong: 'Lar dos Bigodes',
//       cidade: 'Ribeirão Preto - SP',
//       imageUrl: 'cat',
//     ),
//     Animal(
//       id: '3',
//       nome: 'Thor',
//       especie: 'Cão',
//       raca: 'Labrador mix',
//       idade: '3 anos',
//       sexo: 'Macho',
//       descricao: 'Thor é grande, mas tem coração maior ainda! Adestrado, obediente e super leal. Precisa de espaço para correr.',
//       ong: 'ONG Patinhas Felizes',
//       cidade: 'Sertãozinho - SP',
//       imageUrl: 'dog',
//     ),
//     Animal(
//       id: '4',
//       nome: 'Luna',
//       especie: 'Gato',
//       raca: 'Persa mix',
//       idade: '4 meses',
//       sexo: 'Fêmea',
//       descricao: 'Luna é um filhote fofo e brincalhão. Adora brincar com bolinhas e é muito afetiva. Primeira vacina em dia.',
//       ong: 'Lar dos Bigodes',
//       cidade: 'Ribeirão Preto - SP',
//       imageUrl: 'cat',
//     ),
//     Animal(
//       id: '5',
//       nome: 'Rex',
//       especie: 'Cão',
//       raca: 'Pitbull mix',
//       idade: '5 anos',
//       sexo: 'Macho',
//       descricao: 'Rex foi resgatado de maus-tratos. Após muito amor e cuidado, se tornou um cão dócil e companheiro. Castrado e vacinado.',
//       ong: 'Resgate Animal RP',
//       cidade: 'Ribeirão Preto - SP',
//       imageUrl: 'dog',
//     ),
//     Animal(
//       id: '6',
//       nome: 'Mimi',
//       especie: 'Gato',
//       raca: 'Angorá mix',
//       idade: '2 anos',
//       sexo: 'Fêmea',
//       descricao: 'Mimi é independente mas muito carinhosa quando quer. Ótima companhia para quem passa o dia em casa.',
//       ong: 'Lar dos Bigodes',
//       cidade: 'Franca - SP',
//       imageUrl: 'cat',
//     ),
//   ];

//   List<Animal> get animais => List.unmodifiable(_animais);

//   List<Animal> get favoritos => _animais.where((a) => a.favorito).toList();

//   List<Animal> filtrar({String? especie, String? cidade}) {
//     return _animais.where((a) {
//       final filtroEspecie = especie == null || especie == 'Todos' || a.especie == especie;
//       final filtroCidade = cidade == null || cidade.isEmpty || a.cidade.toLowerCase().contains(cidade.toLowerCase());
//       return filtroEspecie && filtroCidade;
//     }).toList();
//   }

//   void toggleFavorito(String id) {
//     final index = _animais.indexWhere((a) => a.id == id);
//     if (index != -1) {
//       _animais[index].favorito = !_animais[index].favorito;
//       notifyListeners();
//     }
//   }

//   Animal? buscarPorId(String id) {
//     try {
//       return _animais.firstWhere((a) => a.id == id);
//     } catch (_) {
//       return null;
//     }
//   }
// }