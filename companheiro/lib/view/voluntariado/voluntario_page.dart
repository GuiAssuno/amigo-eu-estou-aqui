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
      appBar: AppBar(
        title: TextField( 
          controller: _buscaCtrl,
          decoration: InputDecoration(
            hintText: 'Buscar por...',
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ) ,
      ),


      body: SafeArea (
        child:  Column(
          children: [Container(
              //color: const Color(0xFF4CAF7D),// Header verde
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  const SizedBox(height: 12),
                  listaVagas(controller),
                ],
              ),
            ),
          ],
        ),
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
      color: Color(0xff482984),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 1, 1, 1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      // 2. Usamos o Image.asset para ler a foto que está na pasta do seu computador
      child: Text(tipoVaga) // A MÁGICA: Isso faz a foto preencher o Container sem esticar, cortando as sobras estilo Instagram!
  );
}


}

Widget listaVagas(VoluntariadoController controller) {
  return ListView.builder(
    itemCount: controller.vagas.length,
    itemBuilder: (context, index){
      final vagaAtual = controller.vagas[index];

      return InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetalheVaga(),)
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
    }
  );
}




































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