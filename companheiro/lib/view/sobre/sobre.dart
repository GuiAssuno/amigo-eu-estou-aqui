import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// scroll view personalizado, rolagem personalizada, visualização de rolagem personalizada, área de rolagem personalizada, widget de rolagem personalizada// slivers são os filhos do CustomScrollView, elementos de rolagem, componentes de rolagem, itens de rolagem, widgets de rolagem
      body: CustomScrollView( slivers: <Widget>[ 
//===========================================================================================================
//================================================          APPBAR            ===============================
//===========================================================================================================
        SliverAppBar( // barra de aplicativo deslizante
          expandedHeight: 260, // altura expandida, altura do app bar expandida, altura do cabeçalho expandida, altura da barra de aplicativo expandida
          pinned: true, // fixar o app bar, manter o app bar visível, manter o cabeçalho visível, manter a barra de aplicativo visível, fixar o cabeçalho, fixar a barra de aplicativo
          backgroundColor:  const Color.fromARGB(255, 250, 237, 216) ,
          foregroundColor: const Color(0xFF2C2C2A),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand, // expandir para preencher, expandir para ocupar, expandir para preencher espaço, expandir para ocupar espaço, expandir para preencher o espaço disponível
              children: [
//___________________________________________________________LOGO____________________________________________
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'), // Puxa a foto
                      fit: BoxFit.cover, // A imagem cobre todo o espaço disponível
                    ),
                  ),
                  
                  child: const Center(
                  ),
                ),
              ],
            ),
          ),
        ),
//===========================================================================================================
//================================================          CORPO            ================================    
//===========================================================================================================
        SliverToBoxAdapter( 
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

//##################################################          LINHA           ###############################
                Row( crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                      Text( 'BLABLA ',        // titulo
                        style: 
                        const TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold, 
                          color: Color(0xFF2C2C2A)
                        ),
                      ),
                                                                
                      Text( 'PIPIPIPI',       // subtitulo
                        style: 
                          const TextStyle(
                            fontSize: 16, 
                            color: Color.fromARGB(255, 129, 129, 129)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

//===========================================================================================================
//================================  OBJETIVO APLICATIVO  ====================================================
//===========================================================================================================            
                Caixinha(
                  icone: Icons.info_outline, 
                  titulo: 'Objetivo do Aplicativo', 
                  conteudo: 'O Hub Solidário conecta pessoas que desejam adotar animais ou realizar voluntariado com ONGs e projetos sociais. De um lado, famílias encontram bichinhos que precisam de um lar. Do outro, voluntários encontram oportunidades de impacto social de acordo com seu perfil e disponibilidade.', 
                ),
                const SizedBox(height: 20),

//===========================================================================================================
//====================================        EQUIPE DE DESENVOLVIMENTO       ===============================
//===========================================================================================================
                Caixinha(
                  icone: Icons.group_outlined, 
                  titulo: 'Equipe de Desenvolvimento', 
                  conteudo: 'Guilherme Assunção - Desenvolvedor Flutter', 
                ),   
                const SizedBox(height: 20),

//===========================================================================================================
//==========================================        INFORMAÇÕES ACADÊMICAS        ===========================
//===========================================================================================================
                Caixinha(
                  icone: Icons.group_outlined, 
                  titulo: 'Informações Acadêmicas', 
                  conteudo: 'Disciplina:\t  Desenvolvimento Mobile com Flutter\nInstituição:\t FATEC-RP\nProfessor:\t  Rodrigo plotz' 
                ), 
                const SizedBox(height: 20),

//===========================================================================================================
//============================================        TECNOLOGIAS UTILIZADAS         ========================
//===========================================================================================================  
                Caixinha(
                  icone: Icons.code_outlined, 
                  titulo: 'Tecnologias Utilizadas', 
                  conteudo: 'Flutter\nDart', 
                ),
                const SizedBox(height: 20),

//===========================================================================================================
//============================================DEDICATORIA===============================================================
//===========================================================================================================
                Caixinha(
                  icone: Icons.group_outlined, 
                  titulo: 'Dedicatoria', 
                  conteudo: 'Julia Roberta da Silva, \nPessoa que admiro, Amiga que inspira, Mulher que amo. \nApesar de todos os defeitos, sempre farei o meu melhor para você' 
                ),
                const SizedBox(height: 20),

//===========================================================================================================
//=========================================                     =============================================
//===========================================================================================================
                Caixinha(
                  icone: Icons.info_outline, 
                  titulo: '', 
                  conteudo: '', 
                ),
                const SizedBox(height: 20),

//===========================================================================================================
//============================================                         ======================================
//===========================================================================================================
                Caixinha(
                  icone: Icons.info_outline, 
                  titulo: '', 
                  conteudo: '', 
                ),
                const SizedBox(height: 20),

//===========================================================================================================
//============================================     SOBRE MIM      ===========================================
//===========================================================================================================
                  Caixinha(
                  icone: Icons.info_outline, 
                  titulo: 'Sobre mim', 
                  conteudo: 'Guilherme Assunção Barboza', 
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}


// Classe para criar caixas de informações padronizadas
class Caixinha extends StatelessWidget {
  final IconData icone;      // Recebe icone
  final String titulo;      // Recebe titulo
  final String conteudo;   // Recebe conteudo

  const Caixinha({
    required this.icone,
    required this.titulo,
    required this.conteudo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(                             // Configurações visuais da caixa
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(  // Linha do ícone e título                            
            children: [
              Icon(icone, color: const Color(0xFFE8734A), size: 22),
              const SizedBox(width: 8),
              Text(titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
            ],
          ),
            const SizedBox(height: 10),

            // Texto do conteúdo
            Text(conteudo, style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),
        ],
      ),
    );
  }
}