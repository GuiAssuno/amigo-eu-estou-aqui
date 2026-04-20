import 'package:flutter/material.dart';

import '/view/home/home_page.dart';
import '/view/animais/animal_page.dart';
import '/view/voluntariado/voluntario_page.dart';
import '/view/sos/sos_page.dart';



class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 1;

  final List<Widget> _telas = const [ // lista de telas para cada item da barra de navegação
     AnimalPage(),
     HomePage(),
     VoluntarioPage(),
     SosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(  

      body: _telas[_indiceAtual],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,                       // indice da tela atual
        onTap: (index) => setState(() => _indiceAtual = index),   // atualiza o estado para mudar a tela
        selectedItemColor: const Color(0xffE7DFD5),                    // cor do item selecionado
        unselectedItemColor: const Color.fromARGB(255, 96, 116, 156),  // cor dos itens não selecionados
        showUnselectedLabels: true,                                      // mostra os rótulos dos itens não selecionados |  (context.size.width > 400) mostra só se largura da tela for maior que 400 pixels     
//________________________________________________itens da barra de navegação________________________________________________
        items: const [  
          BottomNavigationBarItem( // pagina de adoção
            icon: Icon(Icons.pets),
            label: 'Adoçao',
          ),

          BottomNavigationBarItem( // pagina inicial
            icon: Icon(Icons.home),
            label: 'Home',
            
          ),

          BottomNavigationBarItem( // pagina de voluntariado
            icon: Icon(Icons.handshake),
            label: 'Voluntario',
          ),

          BottomNavigationBarItem( // pagina de sos
            icon: Icon(Icons.location_searching_outlined),
            label: 'S.O.S',          
          ),
        ],
      ),
    );
  }
}