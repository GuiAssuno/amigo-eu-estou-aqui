import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EE),
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor: const Color(0xFF204051),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // Logo
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF204051),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF204051),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(Icons.volunteer_activism, color: Colors.white, size: 50),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hub Solidário',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
            ),
            const Text(
              'Versão 1.0.0',
              style: TextStyle(color: Color(0xFF888780), fontSize: 13),
            ),
            const SizedBox(height: 28),

            // Objetivo
            _SecaoCard(
              icone: Icons.info_outline,
              titulo: 'Objetivo do aplicativo',
              conteudo:
                  'O Hub Solidário conecta pessoas que desejam adotar animais ou realizar voluntariado com ONGs e projetos sociais. '
                  'De um lado, famílias encontram bichinhos que precisam de um lar. '
                  'Do outro, voluntários encontram oportunidades de impacto social de acordo com seu perfil e disponibilidade.',
            ),
            const SizedBox(height: 16),

            // Equipe
            _SecaoCard(
              icone: Icons.group_outlined,
              titulo: 'Equipe de desenvolvimento',
              conteudo: '',
              filhos: const [
                _MembroEquipe(nome: 'Nome do Integrante 1', papel: 'Desenvolvedor Flutter'),
                _MembroEquipe(nome: 'Nome do Integrante 2', papel: 'Desenvolvedor Flutter'),
              ],
            ),
            const SizedBox(height: 16),

            // Disciplina / Instituição
            _SecaoCard(
              icone: Icons.school_outlined,
              titulo: 'Informações acadêmicas',
              conteudo: '',
              filhos: const [
                _InfoAcademica(rotulo: 'Disciplina', valor: 'Desenvolvimento Mobile com Flutter'),
                _InfoAcademica(rotulo: 'Instituição', valor: 'Nome da Instituição de Ensino'),
                _InfoAcademica(rotulo: 'Professor', valor: 'Nome do Professor'),
              ],
            ),
            const SizedBox(height: 16),

            // Tecnologias
            _SecaoCard(
              icone: Icons.code_outlined,
              titulo: 'Tecnologias utilizadas',
              conteudo: '',
              filhos: const [
                _InfoAcademica(rotulo: 'Framework', valor: 'Flutter SDK'),
                _InfoAcademica(rotulo: 'Linguagem', valor: 'Dart'),
                _InfoAcademica(rotulo: 'Gerenciamento de estado', valor: 'Provider (ChangeNotifier)'),
                _InfoAcademica(rotulo: 'Plataformas', valor: 'Android e iOS'),
              ],
            ),

            const SizedBox(height: 32),
            const Text(
              'Feito com ❤️ para conectar corações',
              style: TextStyle(color: Color(0xFF888780), fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
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
