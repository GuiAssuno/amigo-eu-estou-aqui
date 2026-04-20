import '/model/modelos.dart';

class ListaVoluntariado {
  
  Future<List<Vaga>> buscarVagas() async {

    return [
      Vaga(
        id: '1',
        titulo: 'Cuidador de Animais',
        ong: 'ONG Patinhas Felizes',
        descricao: 'Ajude a cuidar dos animais resgatados: alimentar, medicar e socializar. Atividade presencial no abrigo.',
        tipo: 'Cuidados com animais',
        cidade: 'Ribeirão Preto - SP',
        disponibilidade: 'Fins de semana',
        vagasDisponiveis: 5,
      ),
      Vaga(
        id: '2',
        titulo: 'Designer Gráfico Voluntário',
        ong: 'Lar dos Bigodes',
        descricao: 'Criação de artes para redes sociais, cartazes de adoção e materiais de divulgação da ONG.',
        tipo: 'Design e Comunicação',
        cidade: 'Remoto',
        disponibilidade: 'Flexível',
        vagasDisponiveis: 2,
      ),
      Vaga(
        id: '3',
        titulo: 'Motorista para Resgates',
        ong: 'Resgate Animal RP',
        descricao: 'Transporte de animais resgatados para o abrigo e para consultas veterinárias.',
        tipo: 'Transporte',
        cidade: 'Ribeirão Preto - SP',
        disponibilidade: 'Plantão (escala)',
        vagasDisponiveis: 3,
      ),
      Vaga(
        id: '4',
        titulo: 'Professor de Reforço Escolar',
        ong: 'Instituto Semear',
        descricao: 'Aulas de matemática e português para crianças de 8 a 14 anos em situação de vulnerabilidade social.',
        tipo: 'Educação',
        cidade: 'Ribeirão Preto - SP',
        disponibilidade: 'Seg, Qua e Sex (tarde)',
        vagasDisponiveis: 4,
      ),
      Vaga(
        id: '5',
        titulo: 'Fotógrafo para Adoções',
        ong: 'ONG Patinhas Felizes',
        descricao: 'Fotografar os animais disponíveis para adoção a fim de melhorar os perfis deles nas plataformas digitais.',
        tipo: 'Fotografia',
        cidade: 'Ribeirão Preto - SP',
        disponibilidade: 'Quinzenal (sábados)',
        vagasDisponiveis: 1,
      ),
      Vaga(
        id: '6',
        titulo: 'Assistente Administrativo',
        ong: 'Resgate Animal RP',
        descricao: 'Apoio em tarefas administrativas: e-mails, controle de doações, cadastros e relatórios.',
        tipo: 'Administrativo',
        cidade: 'Remoto',
        disponibilidade: 'Flexível (4h/semana)',
        vagasDisponiveis: 2,
      ),
    ];
  }
}