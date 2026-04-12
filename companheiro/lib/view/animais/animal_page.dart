import 'package:companheiro/model/modelos.dart';
import 'package:flutter/material.dart';

import 'package:companheiro/view/animais/detalhe_animal.dart'; 

class AnimalPage extends StatefulWidget { // tela que muda estado, corpo da televisão
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> { // tela que muda estado, tela da televisão 
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoção', ),
        titleSpacing: 16, // aqui pode ser personalizada a distância do título do appbar, caso seja necessário
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // aqui pode ser personalizada a ação de atualização da lista de animais, caso seja necessário
            },
          ),
        ],
        //actionsIconTheme: context.theme.iconTheme.copyWith(color: Colors.white), // aqui pode ser personalizada a cor dos ícones de ação, caso seja necessário
        //actionsPadding: context.padding.all(8), // aqui pode ser personalizada a distância entre
        ),
      
      body: Center(
        //child: Text('Lista de Animais'),
        // aqui pode ser personalizada a exibição da lista de animais, caso seja necessário
        child: listaAnimais()
      ),
    );
  }
}


class FotoAnimal extends StatelessWidget { // tela que não muda estado
  //  final Animal animal;
  //const FotoAnimal({required this.animal});

  final Color cor_fundo;
  final String textodafoto;

  const FotoAnimal({
    super.key, 
    required this.cor_fundo,
    required this.textodafoto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: cor_fundo, // aqui pode ser personalizada a cor de fundo da imagem, caso seja necessário
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 1, 1, 1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(textodafoto,
            style: const TextStyle( 
              color: Color.fromARGB(255, 241, 241, 241), 
              fontWeight: FontWeight.bold
            )
          ), // aqui pode ser personalizada a exibição da foto do animal, caso seja necessário
        ),
      );
  }
}


Widget listaAnimais() {
    // aqui pode ser personalizada a lista de animais, caso seja necessário
  final List<Color> coresDasFotos = [
    const Color.fromARGB(255, 81, 143, 86),
    const Color.fromARGB(255, 134, 38, 38),
    const Color.fromARGB(255, 44, 46, 139),
  ];

  return ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index){

      return InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetalheAnimal(),)
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
                child: PageView.builder(
                  itemCount: coresDasFotos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FotoAnimal(
                      cor_fundo: coresDasFotos[index], 
                      textodafoto: 'Imagem ${index + 1}'
                    );                      
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text('Nome do Animal ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Raça do Animal', style: TextStyle(fontSize: 14, color: Color(0xFF5F5E5A))),
              const SizedBox(height: 8),
              const Text('Descrição breve sobre o animal para atrair os adotantes.', style: TextStyle(fontSize: 12, color: Color(0xFF5F5E5A))),
                    
              ],
            ),
          ),
        ),
      );
    },
  );
}
