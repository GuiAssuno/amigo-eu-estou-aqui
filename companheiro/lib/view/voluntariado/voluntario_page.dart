import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/controller/voluntariado_controle.dart';
import 'detalhe_vaga.dart';


class VoluntarioPage extends StatefulWidget {
  const VoluntarioPage({super.key});

  void _atualizarLista() { // função para atualizar a lista de vagas, função para recarregar a lista de vagas, função para atualizar os dados das vagas, função para recarregar os dados das vagas
  }
  
  @override
  State<VoluntarioPage> createState() => _VoluntarioPageState();
}

class _VoluntarioPageState extends State<VoluntarioPage> {
  String _filtroArea = 'Todas'; // filtro de área, filtro de categoria, filtro de tipo, filtro de setor, filtro de segmento
  final _buscaCtrl = TextEditingController(); // controlador de busca, controlador de pesquisa, controlador de filtro, controlador de texto, controlador de campo de texto
  
  get areas => null; // lista de áreas, lista de categorias, lista de tipos, lista de setores, lista de segmentos



  @override
  Widget build(BuildContext context) {
  final controller = context.watch<VoluntariadoController>(); // controlador de estado
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[ // lista de slivers

//=====================================================================================================================        
//===================================================        APPBAR       =============================================        
//=====================================================================================================================        
        SliverAppBar( 
          floating: true, // assim que rolar pra cima
          snap: true,     // pra aparecer
          pinned: false,  // Some totalmente ao descer
          backgroundColor: Color(0xFF3B6978),
          
          title: TextField( 
            controller: _buscaCtrl, // controlador de busca
            decoration: InputDecoration(
              hintText: 'Buscar por...',
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              filled: true, // preenchido cor de fundo
              fillColor: const Color(0xFFFDF6EE),
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),

              contentPadding: const EdgeInsets.symmetric(vertical: 10), // padding interno do campo de texto
            ),
          ),
        ),

//=====================================================================================================================        
//===================================================        CORPO       =============================================        
//=====================================================================================================================              
        SliverPadding( 
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
              sliver: listaVagas(controller), // lista de vagas, lista de oportunidades, lista de posições, lista de funções, lista de trabalhos
            ),
          ],
        ),
    );
  }
}

//=====================================================================================================================        
//==============================================        CLASS ContainerVaga        ====================================        
//=====================================================================================================================  
class ContainerVaga extends StatelessWidget{
  final String tipoVaga;      // tipo de vaga
  final String tituloVaga;    // título da vaga
  final String descricaoVaga; // descrição da vaga
  final String ongVaga;       // ONG da vaga

  const ContainerVaga ({ // construtor
    super.key, 
    required this.ongVaga, 
    required this.tipoVaga, 
    required this.tituloVaga,  
    required this.descricaoVaga,  
  });

  //  metodo que define as cores com base no tipo de vaga
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
        color: corVaga.corContainer, // cor do container
        border: Border( // borda do container
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
            // Titulo da vaga
            Text(tituloVaga, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), 
            const SizedBox(height: 8),
            
            // ONG e tipo da vaga
            Text('$tipoVaga - $ongVaga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
            const SizedBox(height: 4),
        
            // Descrição da vaga
            Text(descricaoVaga, style: TextStyle(fontSize: 16,)), 
          ],
        ),
      ) 
    );
  }
}


//=====================================================================================================================
//==================================================        WIDGET listaVagas        ==================================
//=====================================================================================================================
@override
Widget listaVagas(VoluntariadoController controller) {
  // cria um widget de lista para exibir as vagas de voluntariado
  // recebe o controlador de voluntariado para acessar a lista de vagas
  // cada item da lista é um permite que o usuário toque para ver os detalhes da vaga
  return SliverList(
    delegate: SliverChildBuilderDelegate( (context, index) {
        final vagaAtual = controller.vagas[index];
        
        return GestureDetector( // detector de clique
          onTap: () => Navigator.push( // navegação para a página de detalhes da vaga 
          context, // contexto de navegação
          MaterialPageRoute(builder: (context) => DetalheVaga(),) // rota para a página de detalhes da vaga
          ),

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity, // ocupa toda a largura disponível
                
                // Chama o widget ContainerVaga para exibir as informações da vaga atual
                child: ContainerVaga( 
                    ongVaga: vagaAtual.ong,             // ONG da vaga
                    tipoVaga: vagaAtual.tipo,           // tipo de vaga
                    tituloVaga: vagaAtual.titulo,       // título da vaga
                    descricaoVaga: vagaAtual.descricao, // descrição da vaga 
                ),
              ),
            ],
          ),
        );
      },
      childCount: controller.vagas.length, // quantidade de vagas que ele tem
    ),
  );
}