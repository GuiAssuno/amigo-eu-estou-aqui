import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/model/animal.dart';
import '/model/modelos.dart';

class AnimalController extends ChangeNotifier { 
  final ListaAnimais listaAnimal = GetIt.I<ListaAnimais>();

  List<Animal> listAnimais = []; // lista que será preenchida com os dados do banco de dados
  bool bolinhaCarregando = false; // variável para exibição da bolinha de carregamento

  List<Animal> get animais => listAnimais;  // getter para acessar a lista de animais
  bool get carregando => bolinhaCarregando; // getter para acessar o estado de carregamento

//=================================================================================================
//========================================     CARREGAR ANIMAIS    ================================
//=================================================================================================
  Future<void> carregarAnimais() async {
    // ativa a bolinha de carregamento
    bolinhaCarregando = true; 
    notifyListeners(); // avisa para MOSTRAR a bolinha de carregamento

    // busca os animais do banco de dadoos
    listAnimais = await listaAnimal.buscarAnimais(); 
    
    // desativa a bolinha de carregamento
    bolinhaCarregando = false; 
    notifyListeners(); // avisa para ESCONDER a bolinha de carregamento 
  }
}