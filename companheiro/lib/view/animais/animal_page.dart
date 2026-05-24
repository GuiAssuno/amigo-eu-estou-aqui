import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/view/animais/detalhe_animal.dart'; 
import '/controller/animal_controle.dart';

class AnimalPage extends StatefulWidget { // tela que muda estado, corpo da televisão
  const AnimalPage({super.key});

  void atualizarLista() { // função para atualizar a lista de animais, função para recarregar a lista de animais, função para atualizar os dados dos animais, função para recarregar os dados dos animais
  }

  @override
  State<AnimalPage> createState() => _AnimalPageState(); // estado da tela, estado do corpo da televisão
}

class _AnimalPageState extends State<AnimalPage> { // tela que muda estado, tela da televisão 
  @override
    void initState() {
      super.initState();
      // Assim que a tela nascer, pedimos ao Controller para buscar os animais.
      // Lemos de forma discreta usando context.read
      final controller = context.read<AnimalController>();
      
      // Só carrega se a lista estiver vazia (para não gastar internet toda vez que trocar de aba)
      if (controller.animais.isEmpty) {
        controller.carregarAnimais();
      }
    }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AnimalController>(); // controlador de estado, controlador de tela
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoção', ),
        titleSpacing: 16,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.carregarAnimais();
            },
          ),
        ],
      ),
      
      body: Center(
        child: controller.carregando 
          ? const CircularProgressIndicator(color: Color(0xFF3B6978)) 
          : listaAnimais(controller), // Se não estiver carregando, mostra a lista!
      ),
    );
  }
}

//=================================================================================================
//========================================     FOTO ANIMAL    =====================================
//=================================================================================================
class FotoAnimal extends StatelessWidget { 
  final String caminhoFoto;

  const FotoAnimal({
    super.key, 
    required this.caminhoFoto,  // caminho da foto
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration( //decoração do container
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 1, 1, 1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
//_____________________________________________imagem do animal____________________________________
      child: Image.asset( 
        caminhoFoto,
        fit: BoxFit.cover, // ajusta a imagem para caber no container 
      ),
    );
  }
}

//=================================================================================================
//========================================     LISTA DE ANIMAIS    ================================
//=================================================================================================
Widget listaAnimais(AnimalController controller) {
  return ListView.builder(
    itemCount: controller.animais.length, // quantidade de animais que ele tem
    itemBuilder: (context, index){ // construtor de item, construtor de cartão, construtor de card, construtor de container

      final animalAtual = controller.animais[index];

      return GestureDetector(  // detector de gestos
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetalheAnimal(idAnimal: animalAtual.id,),)
        ),
      
        child: Card( // cartão, card
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
                child: ClipRRect( // recorte arredondado
                  child: PageView.builder( // visualização de página
                    itemCount: animalAtual.fotos.length, // quantidade de fotos que ele tem
                    itemBuilder: (BuildContext context, int fotoIndex) {
                      return FotoAnimal( // widget de foto, widget de imagem, widget de recurso, widget de ativo, widget de asset
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
