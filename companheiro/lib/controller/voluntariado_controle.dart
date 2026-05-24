import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '/model/modelos.dart';
import '/model/voluntariado.dart';

// controlador de voluntariado
class VoluntariadoController extends ChangeNotifier { 

  // 1. Contrata o Service para fazer o trabalho pesado
  final ListaVoluntariado lista = GetIt.I<ListaVoluntariado>();

  // 2. Variáveis de estado escondidas (nascem vazias)
  List<Vaga> listaVagas = [];
  List<Vaga> listaVagasFiltradas = [];
  bool bolinhaCarregando = false;

  // 3. Getters para a Tela ler com segurança (sem bagunçar os dados)
  List<Vaga> get vagas => listaVagasFiltradas;
  bool get carregando => bolinhaCarregando;

  // 4. A Função que a Tela vai chamar (no initState ou em um botão)
  Future<void> carregarVagas() async {
    bolinhaCarregando = true;
    notifyListeners(); // Avisa a tela para mostrar a bolinha de loading

    // Busca os dados lá no Service
    listaVagas = await lista.buscarVagas();
    listaVagasFiltradas = listaVagas;

    bolinhaCarregando = false;
    notifyListeners(); // Avisa a tela que os dados chegaram e pode montar a lista
  }

  void pesquisar(String texto) {
    if (texto.isEmpty) {
      listaVagasFiltradas = listaVagas;
    } else {

      listaVagasFiltradas = listaVagas.where((vaga) {
        final titulo = vaga.titulo.toLowerCase();
        final ong = vaga.ong.toLowerCase();
        final busca = texto.toLowerCase();
        
        return titulo.contains(busca) || ong.contains(busca);
      }).toList();
    }
    
    notifyListeners();
  }
}