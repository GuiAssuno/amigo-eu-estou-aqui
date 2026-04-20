import 'package:flutter/foundation.dart';
import '/model/modelos.dart';
import '/model/voluntariado.dart';

// controlador de voluntariado
class VoluntariadoController extends ChangeNotifier { 

  // 1. Contrata o Service para fazer o trabalho pesado
  final ListaVoluntariado lista = ListaVoluntariado();

  // 2. Variáveis de estado escondidas (nascem vazias)
  List<Vaga> listaVagas = [];
  bool bolinhaCarregando = false;

  // 3. Getters para a Tela ler com segurança (sem bagunçar os dados)
  List<Vaga> get vagas => listaVagas;
  bool get carregando => bolinhaCarregando;

  // 4. A Função que a Tela vai chamar (no initState ou em um botão)
  Future<void> carregarVagas() async {
    bolinhaCarregando = true;
    notifyListeners(); // Avisa a tela para mostrar a bolinha de loading

    // Busca os dados lá no Service
    listaVagas = await lista.buscarVagas();

    bolinhaCarregando = false;
    notifyListeners(); // Avisa a tela que os dados chegaram e pode montar a lista
  }
}