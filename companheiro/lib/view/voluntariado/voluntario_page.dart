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
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
              sliver: listaVagas(controller),
            ),
          ],
        ),
    );
  }
}

class ContainerVaga extends StatelessWidget{
  final String tipoVaga;
  final String tituloVaga;
  final String descricaoVaga;
  final String ongVaga;

  const ContainerVaga ({
    super.key, 
    required this.ongVaga,
    required this.tipoVaga, 
    required this.tituloVaga, 
    required this.descricaoVaga, 
  });

  ({Color corContainer, Color corBorda}) get corVaga {
    switch (tipoVaga) {
      case 'Educação': return (corContainer: const Color.fromARGB(255, 138, 168, 198), corBorda: const Color.fromARGB(255, 18, 82, 146));
      case 'Design e Comunicação': return (corContainer:Color.fromARGB(255, 183, 154, 164), corBorda: const Color.fromARGB(255, 143, 31, 68));
      case 'Fotografia': return (corContainer: const Color.fromARGB(255, 166, 159, 149), corBorda: const Color.fromARGB(255, 129, 78, 7));
      case 'Transporte': return (corContainer: const Color.fromARGB(255, 134, 149, 115), corBorda: const Color.fromARGB(255, 54, 93, 7));
      default: return (corContainer: const Color(0xFFE7DFD5), corBorda: const Color.fromARGB(255, 159, 113, 56));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        color: corVaga.corContainer,
        border: Border(
          top: BorderSide(width: 6,color: corVaga.corBorda),
          left: BorderSide(width: 3,color: corVaga.corBorda),
          right: BorderSide(width: 3,color: corVaga.corBorda),
          bottom: BorderSide(width: 6, color: corVaga.corBorda),
        ),
        
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 1, 1, 1),
          ),
        ],
      ),

      child: Padding(  
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tituloVaga, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('$tipoVaga - $ongVaga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
            const SizedBox(height: 4),
            Text(descricaoVaga, style: TextStyle(fontSize: 16,)), 
          ],
        ),
      ) 
    );
  }
}

@override
Widget listaVagas(VoluntariadoController controller) {
  return SliverList(
    delegate: SliverChildBuilderDelegate( (context, index) {
        final vagaAtual = controller.vagas[index];
        
        return GestureDetector(
          onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetalheVaga(),)
          ),

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ContainerVaga(
                    ongVaga: vagaAtual.ong,
                    tipoVaga: vagaAtual.tipo,
                    tituloVaga: vagaAtual.titulo,
                    descricaoVaga: vagaAtual.descricao,
                ),
              ),
            ],
          ),
        );
      },
      childCount: controller.vagas.length, 
    ),
  );
}