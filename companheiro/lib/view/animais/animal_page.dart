import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/view/animais/detalhe_animal.dart'; 
import '/controller/animal_controle.dart';

class AnimalPage extends StatefulWidget { // tela que muda estado, corpo da televisão
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> { // tela que muda estado, tela da televisão 

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AnimalController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoção', ),
        titleSpacing: 16,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
            },
          ),
        ],
        ),
      
      body: Center(
        child: listaAnimais(controller)
      ),
    );
  }
}


class FotoAnimal extends StatelessWidget { 
  final String caminhoFoto;

  const FotoAnimal({
    super.key, 
    required this.caminhoFoto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 1, 1, 1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
  
      child: Image.asset(
        caminhoFoto,
        fit: BoxFit.cover, 
      ),
    );
  }
}


Widget listaAnimais(AnimalController controller) {
  return ListView.builder(
    itemCount: controller.listaDeAnimais.length,
    itemBuilder: (context, index){

      final animalAtual = controller.listaDeAnimais[index];

      return InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetalheAnimal(idAnimal: animalAtual.id,),)
        ),
      
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          color: Color.fromARGB(255, 214, 214, 212),
          child: Padding (
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              const SizedBox(height: 8),
              Container(
                height: 300,
                child: ClipRRect(
                  child: PageView.builder(
                    itemCount: animalAtual.fotos.length, // quantidade de fotos que ele tem
                    itemBuilder: (BuildContext context, int fotoIndex) {
                      return FotoAnimal(
                        caminhoFoto: animalAtual.fotos[fotoIndex],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(animalAtual.nome, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(animalAtual.raca, style: TextStyle(fontSize: 14, color: Color(0xFF000000))),
              const SizedBox(height: 8),
              Text(animalAtual.descricao, style: TextStyle(fontSize: 12, color: Color(0xFF000000))),
              ],
            ),
          ),
        ),
      );
    },
  );
}
