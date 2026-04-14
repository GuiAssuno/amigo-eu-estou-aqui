import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor:  const Color(0xFFFAEEDA) ,
            foregroundColor: const Color(0xFF2C2C2A),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255), // A cor de fundo continua aqui
                      image: const DecorationImage(
                        image: AssetImage('assets/images/logo.png'), // Puxa a foto
                        fit: BoxFit.cover, 
                      ),
                    ),
                    child: const Center(
                     
                       
                    ),
                  ),
                  // Positioned(
                  //   top: 16,
                  //   right: 16,
                  //   child: SafeArea(
                  //     child: GestureDetector(
                        
                  //       child: Container(
                  //         padding: const EdgeInsets.all(10),
                  //         decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  //         child: Icon(Icons.favorite_border,
                  //           color:  Colors.red,
                  //           size: 22,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
      

      SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'animal.nome',
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
                            ),
                            Text(
                              'animal.raca',
                              style: const TextStyle(fontSize: 16, color: Color(0xFF888780)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF7D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'animal.especie',
                          style: const TextStyle(color: Color(0xFF4CAF7D), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Características
                  Row(
                    children: [
                    ],
                  ),
                  const SizedBox(height: 20),











                  Container(
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
                        Row(
                          children: [
                            Icon(Icons.info_outline, color: const Color(0xFFE8734A), size: 22),
                            const SizedBox(width: 8),
                            Text('Objetivo do aplicativo', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
                          ],
                        ),



                          const SizedBox(height: 10),
                          Text( 'O Hub Solidário conecta pessoas que desejam adotar animais ou realizar voluntariado com ONGs e projetos sociais. '
                                'De um lado, famílias encontram bichinhos que precisam de um lar. '
                                'Do outro, voluntários encontram oportunidades de impacto social de acordo com seu perfil e disponibilidade.', 
                                style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),


                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Container(
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
                        Row(
                          children: [
                            Icon(Icons.group_outlined, color: const Color(0xFFE8734A), size: 22),
                            const SizedBox(width: 8),
                            Text('Equipe de desenvolvimento', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
                          ],
                        ),
                          const SizedBox(height: 10),
                          Text( 'Guilherme Assunção - Desenvolvedor Flutter', 
                                style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),


                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
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
                        Row(
                          children: [
                            Icon(Icons.school_outlined, color: const Color(0xFFE8734A), size: 22),
                            const SizedBox(width: 8),
                            Text('Informações acadêmicas', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
                          ],
                        ),



                          const SizedBox(height: 10),
                          Text( 'Disciplina:  Desenvolvimento Mobile com Flutter'
                                'Instituição: FATEC-RP'
                                'Professor:   Rodrigo plotz', 
                                style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),
                      ],
                    ),
                  ),



                  const SizedBox(height: 20),
                  Container(
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
                        Row(
                          children: [
                            Icon(Icons.code_outlined, color: const Color(0xFFE8734A), size: 22),
                            const SizedBox(width: 8),
                            Text('Tecnologias utilizadas', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
                          ],
                        ),



                          const SizedBox(height: 10),
                          Text( 'Framework'
                                'Linguagem'
                                'Gerenciamento de estado'
                                'Plataformas', 
                                style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),
                      ],
                    ),
                  ),










                  const SizedBox(height: 20),
                  Container(
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
                        Row(
                          children: [
                            Icon(Icons.heart_broken_outlined, color: const Color(0xFFE8734A), size: 22),
                            const SizedBox(width: 8),
                            Text('Dedicatoria', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
                          ],
                        ),
                          const SizedBox(height: 10),
                          Text( 'Julia Roberta da Silva'
                                'Pessoa que admiro, Amiga que inspira, Mulher que amo'
                                'Apesar de todos os defeitos, sempre farei o perfeito para você', 
                                style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),


                      ],
                    ),
                  ),















                  const SizedBox(height: 20),
                  Container(
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
                        Row(
                          children: [
                            Icon(Icons.info_outline, color: const Color(0xFFE8734A), size: 22),
                            const SizedBox(width: 8),
                            Text('', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
                          ],
                        ),



                          const SizedBox(height: 10),
                          Text( '', 
                                style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),


                      ],
                    ),
                  ),










                  const SizedBox(height: 20),
                  Container(
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
                        Row(
                          children: [
                            Icon(Icons.info_outline, color: const Color(0xFFE8734A), size: 22),
                            const SizedBox(width: 8),
                            Text('', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
                          ],
                        ),



                          const SizedBox(height: 10),
                          Text( '', 
                                style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),


                      ],
                    ),
                  ),













                  const SizedBox(height: 20),
                   Container(
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
                        Row(
                          children: [
                            Icon(Icons.info_outline, color: const Color(0xFFE8734A), size: 22),
                            const SizedBox(width: 8),
                            Text('', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
                          ],
                        ),



                          const SizedBox(height: 10),
                          Text( '', 
                                style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),


                      ],
                    ),
                  ),

                 
                  const SizedBox(height: 20),

                  const Text('Sobre mim', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    '',
                    style: const TextStyle(fontSize: 15, color: Color(0xFF5F5E5A), height: 1.6),
                  ),
                  const SizedBox(height: 32),

                  // Botão adotar
                  
                    
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
    ],
  ),
);
  }
}





Widget listaSobre( BuildContext context){

  return ListTile(
    leading: Container(
      padding: EdgeInsets.all(8),
      width: 100,
      child: Placeholder()),
      title: Text('Place' ),
    );

}












class _SecaoCard extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String conteudo;
  final List<Widget>? filhos;

  const _SecaoCard({
    required this.icone,
    required this.titulo,
    required this.conteudo,
    this.filhos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icone, color: const Color(0xFFE8734A), size: 22),
              const SizedBox(width: 8),
              Text(titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A))),
            ],
          ),
          if (conteudo.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(conteudo, style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A), height: 1.6)),
          ],
          if (filhos != null) ...[
            const SizedBox(height: 12),
            ...filhos!,
          ],
        ],
      ),
    );
  }
}

class _MembroEquipe extends StatelessWidget {
  final String nome;
  final String papel;
  const _MembroEquipe({required this.nome, required this.papel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE8734A).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                nome.isNotEmpty ? nome[0] : '?',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE8734A)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nome, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(papel, style: const TextStyle(fontSize: 12, color: Color(0xFF888780))),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoAcademica extends StatelessWidget {
  final String rotulo;
  final String valor;
  const _InfoAcademica({required this.rotulo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(rotulo, style: const TextStyle(fontSize: 13, color: Color(0xFF888780))),
          ),
          Expanded(
            child: Text(valor, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF2C2C2A))),
          ),
        ],
      ),
    );
  }
}
