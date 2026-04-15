import 'package:companheiro/model/modelos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/controller/voluntariado_controle.dart';
import 'detalhe_vaga.dart';


class VoluntarioPage extends StatefulWidget {
  const VoluntarioPage({super.key});

  @override
  State<VoluntarioPage> createState() => _VoluntarioPageState();
}

class _VoluntarioPageState extends State<VoluntarioPage> {
  String _filtroArea = 'Todas';
  final _buscaCtrl = TextEditingController();
  
  get areas => null;

  @override
  void dispose() {
    _buscaCtrl.dispose();
    super.dispose();
}

 @override
  Widget build(BuildContext context) {
  final controller = context.watch<VoluntariadoController>();
    return Scaffold(

      body: CustomScrollView(
          slivers: <Widget>[ 
            SliverAppBar(
              floating: true, // assim que rolar pra cima
              snap: true,     // pra aparecer
              pinned: false,  // Some totalmente ao descer
              backgroundColor: Color(0xFF3B6978),
              title: TextField( 
                controller: _buscaCtrl,
                decoration: InputDecoration(
                  hintText: 'Buscar por...',
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  filled: true,
                  fillColor: const Color(0xFFFDF6EE),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            
            SliverPadding(

              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              sliver: listaVagas(controller),
            ),
          ],
        ),
    );
  }
}

class ContainerVaga extends StatelessWidget{
  final String tipoVaga;
  const ContainerVaga ({super.key, required this.tipoVaga,});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 191, 151, 255),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 1, 1, 1),
          ),
        ],
      ),
      child: Text(tipoVaga) 
  );
}


}

Widget listaVagas(VoluntariadoController controller) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        final vagaAtual = controller.vagas[index];

        // DAQUI PRA BAIXO FICA TUDO EXATAMENTE IGUAL!
        return InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetalheVaga(),)
        ),
      
        child: Card.outlined(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
                    itemCount: 1, // A quantidade de fotos é a quantidade que o animal tem
                    itemBuilder: (BuildContext context, int fotoIndex) {
                      return ContainerVaga(
                        tipoVaga: vagaAtual.tipo,
                      );                      
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(vagaAtual.titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(vagaAtual.tipo, style: TextStyle(fontSize: 14, color: Color(0xFF000000))),
              const SizedBox(height: 8),
              Text(vagaAtual.descricao, style: TextStyle(fontSize: 12, color: Color(0xFF000000))),
                    
              ],
            ),
          ),
        ),
      );
      },
      // A contagem de itens agora fica no final do delegate:
      childCount: controller.vagas.length, 
    ),
  );
}
























// Scaffold(
//   body: CustomScrollView(
//     slivers: <Widget>[
//       SliverAppBar(
//         floating: true, // Ela flutua ao subir
//         snap: true,     // Ela aparece de vez ao subir
//         pinned: false,  // Ela some totalmente ao descer
//         expandedHeight: 60.0,
//         title: Text('Meu App'),
//         backgroundColor: Colors.blue,
//       ),
//       // O conteúdo da sua página deve ser um Sliver
//       SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (context, index) => ListTile(title: Text('Item #$index')),
//           childCount: 50,
//         ),
//       ),
//     ],
//   ),
// );











// class VoluntarioPage extends StatelessWidget {
//   const VoluntarioPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Voluntários'),
//       ),
//       body: Center(
//         child: Text('Lista de Voluntários'),
//       ),
//     );
//   }
// }