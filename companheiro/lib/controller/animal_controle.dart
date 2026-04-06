class AnimalController extends ChangeNotifier {
  // A lista oficial que aparece na tela
  List<Animal> _listaDeAnimais = [];
  List<Animal> get listaDeAnimais => _listaDeAnimais;

  // Lógica de carregar (Simulando um banco de dados)
  void carregarLoteInicial() {
    // Aqui você decide: Carrega os primeiros 3 animais ao abrir o app
    _listaDeAnimais.addAll(_buscarDoBanco(quantidade: 3));
    notifyListeners();
  }

  void carregarMaisAnimais() {
    // Aqui você decide: Quando o usuário rolar, carrega mais 3
    _listaDeAnimais.addAll(_buscarDoBanco(quantidade: 3));
    notifyListeners();
  }
}











class _AnimalPageState extends State<AnimalPage> {
  // 1. Cria o espião da rolagem
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    
    // 2. Avisa o espião para ficar prestando atenção
    _scrollController.addListener(() {
      
      // A MÁGICA DO GATILHO ACONTECE AQUI:
      // Se a posição atual da rolagem chegar ao MÁXIMO da tela...
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        
        // ...Chama o Provider para carregar o próximo lote!
        Provider.of<AnimalController>(context, listen: false).carregarMaisAnimais();
        
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Limpa a memória quando sair da tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController, // 3. Conecta o espião na sua lista!
      itemCount: provider.listaDeAnimais.length,
      itemBuilder: (context, index) {
        // ... aqui vai aquele seu código lindo do Post com o PageView
      }
    );
  }
}