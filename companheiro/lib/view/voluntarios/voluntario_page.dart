import 'package:companheiro/model/modelos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
  Widget build(BuildContext) {

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
                children: [ const SizedBox(height: 12),
              
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,

                    child: Column(
                    
                    ),
                  ),

                ],

              ),
              
            ),
        


          ],
        ),
      ),
    );
  }
}



class _CardVaga extends StatelessWidget {
  final Vaga vaga;
  const _CardVaga({required this.vaga});

  Color get _corArea {
    switch (vaga.area) {
      case 'Educação': return const Color(0xFF378ADD);
      case 'Design e Comunicação': return const Color(0xFFD4537E);
      case 'Fotografia': return const Color(0xFFBA7517);
      case 'Transporte': return const Color(0xFF639922);
      default: return const Color(0xFF4CAF7D);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra colorida topo
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: _corArea,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          vaga.titulo,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
                        ),
                      ),
                      if (vaga.inscrito)
                        Container(),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(vaga.ong, style: TextStyle(color: _corArea, fontSize: 13, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text(
                    vaga.descricao,
                    style: TextStyle(fontSize: 13, color: Color(0xFF5F5E5A), height: 1.4),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetalheVagaScreen {
}

class _Tag extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Tag({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1EFE8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: const Color(0xFF5F5E5A)),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF5F5E5A))),
        ],
      ),
    );
  }
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