import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';







class VoluntarioController extends ChangeNotifier {
  
}










class VoluntariadoProvider extends ChangeNotifier {
  final List<Vaga> _vagas = [
    Vaga(
      id: '1',
      titulo: 'Cuidador de Animais',
      ong: 'ONG Patinhas Felizes',
      descricao: 'Ajude a cuidar dos animais resgatados: alimentar, medicar e socializar. Atividade presencial no abrigo.',
      area: 'Cuidados com animais',
      cidade: 'Ribeirão Preto - SP',
      disponibilidade: 'Fins de semana',
      vagasDisponiveis: 5,
    ),
    Vaga(
      id: '2',
      titulo: 'Designer Gráfico Voluntário',
      ong: 'Lar dos Bigodes',
      descricao: 'Criação de artes para redes sociais, cartazes de adoção e materiais de divulgação da ONG.',
      area: 'Design e Comunicação',
      cidade: 'Remoto',
      disponibilidade: 'Flexível',
      vagasDisponiveis: 2,
    ),
    Vaga(
      id: '3',
      titulo: 'Motorista para Resgates',
      ong: 'Resgate Animal RP',
      descricao: 'Transporte de animais resgatados para o abrigo e para consultas veterinárias.',
      area: 'Transporte',
      cidade: 'Ribeirão Preto - SP',
      disponibilidade: 'Plantão (escala)',
      vagasDisponiveis: 3,
    ),
    Vaga(
      id: '4',
      titulo: 'Professor de Reforço Escolar',
      ong: 'Instituto Semear',
      descricao: 'Aulas de matemática e português para crianças de 8 a 14 anos em situação de vulnerabilidade social.',
      area: 'Educação',
      cidade: 'Ribeirão Preto - SP',
      disponibilidade: 'Seg, Qua e Sex (tarde)',
      vagasDisponiveis: 4,
    ),
    Vaga(
      id: '5',
      titulo: 'Fotógrafo para Adoções',
      ong: 'ONG Patinhas Felizes',
      descricao: 'Fotografar os animais disponíveis para adoção a fim de melhorar os perfis deles nas plataformas digitais.',
      area: 'Fotografia',
      cidade: 'Ribeirão Preto - SP',
      disponibilidade: 'Quinzenal (sábados)',
      vagasDisponiveis: 1,
    ),
    Vaga(
      id: '6',
      titulo: 'Assistente Administrativo',
      ong: 'Resgate Animal RP',
      descricao: 'Apoio em tarefas administrativas: e-mails, controle de doações, cadastros e relatórios.',
      area: 'Administrativo',
      cidade: 'Remoto',
      disponibilidade: 'Flexível (4h/semana)',
      vagasDisponiveis: 2,
    ),
  ];

  List<Vaga> get vagas => List.unmodifiable(_vagas);

  List<Vaga> get inscritas => _vagas.where((v) => v.inscrito).toList();

  List<Vaga> filtrar({String? area, String? disponibilidade, String? cidade}) {
    return _vagas.where((v) {
      final filtroArea = area == null || area == 'Todas' || v.area == area;
      final filtroDisp = disponibilidade == null || disponibilidade == 'Qualquer' || v.disponibilidade.contains(disponibilidade);
      final filtroCidade = cidade == null || cidade.isEmpty || v.cidade.toLowerCase().contains(cidade.toLowerCase());
      return filtroArea && filtroDisp && filtroCidade;
    }).toList();
  }

  void toggleInscricao(String id) {
    final index = _vagas.indexWhere((v) => v.id == id);
    if (index != -1) {
      _vagas[index].inscrito = !_vagas[index].inscrito;
      notifyListeners();
    }
  }

  List<String> get areas {
    final lista = _vagas.map((v) => v.area).toSet().toList();
    lista.sort();
    return ['Todas', ...lista];
  }

  Vaga? buscarPorId(String id) {
    try {
      return _vagas.firstWhere((v) => v.id == id);
    } catch (_) {
      return null;
    }
  }
}
