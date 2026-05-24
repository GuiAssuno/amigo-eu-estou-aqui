import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/view/sobre/sobre.dart';
import '/view/auth/tela_login.dart';
import '/view/profile/profile_page.dart';
import '/controller/auth_controle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _petImageUrl; // Variável para guardar a URL da imagem que vem da API
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _buscarPetDoDia(); // Busca imagem assim que a tela carrega
  }

  //=================================================================================================
  //=====================================  REQUISIÇÃO GET ===========================================
  //=================================================================================================
  Future<void> _buscarPetDoDia() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Fazendo a requisição para a Dog API
      final url = Uri.parse('https://dog.ceo/api/breeds/image/random');
      final response = await http.get(url);
      
      // Se conseguir pega o link da imagem do JSON 
      if (response.statusCode == 200) {
        final data = json.decode(response.body); 
        setState(() {
          _petImageUrl = data['message']; // message é onde fica a URL
        });
      }
    } catch (e) {
      debugPrint('Erro ao buscar pet: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

//=================================================================================================
//=====================================      FUNÇÃO PARA CONFIRMAR O LOGOUT     ===================
//=================================================================================================
void _confirmarLogout() {  
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Sair'),
        content: const Text('Deseja realmente sair do aplicativo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton( 
            onPressed: () async {
              await Provider.of<AuthController>(context, listen: false).logout();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const TelaLogin()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.volunteer_activism, size: 22, color: Color(0xffE7DFD5),),
            const SizedBox(width: 8),
          ],
        ),
//=================================================================================================
//=====================================      MENU AppBAR     ======================================
//=================================================================================================
        actions: [          
          PopupMenuButton<String>(
            icon: Icon(Icons.account_circle, size: 22, color: const Color(0xffE7DFD5)),
//__________________________________________opções_do_menu_________________________________________
            onSelected: (opcao) {
              if (opcao == 'sobre') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TelaSobre()));
              } else if (opcao == 'sair') {
                _confirmarLogout();
              } else if (opcao == 'profile') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
              }
            },

            itemBuilder: (_) => [ PopupMenuItem( //     item do menu
              height: 16,
              enabled: false,
//____________________________________________________texto de boas vindas__________________________________________
              child: Text( 'Olá', style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),),
              ),
              const PopupMenuDivider(),
//________________________________________________________opção profile__________________________________________
              const PopupMenuItem(value: 'profile', child: Row(
                children: [Icon(Icons.account_circle_outlined, size: 18, color: Color(0xff212A3E)), SizedBox(width: 8), Text('Perfil', )],
              )),
//________________________________________________________opção sobre__________________________________________

              const PopupMenuItem(value: 'sobre', child: Row(
                children: [Icon(Icons.info_outline, size: 18, color: Color(0xff212A3E),), SizedBox(width: 8), Text('Sobre')],
              )),
//_________________________________________________________opção sair__________________________________________
              const PopupMenuItem(value: 'sair', child: Row(
                children:[
                  Icon(Icons.exit_to_app,size: 18, color: Color.fromARGB(255, 255, 17, 0)),
                  SizedBox(width: 8),
                  Text('Sair', style: TextStyle( color: Color.fromARGB(255, 255, 17, 0) ))
                ],
              )),
            ],
          ),
        ],
      ),
      
//=================================================================================================
//==============================================     CORPO    =====================================
//=================================================================================================
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Focinho do Dia 🐾',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff212A3E),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Milhares de animalzinhos estão esperando por um lar. Que tal adotar um amiginho hoje?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
//________________________________________________CARD DA API________________________________________________
            Expanded(
              child: Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: _isLoading 
                    ? const Center(child: CircularProgressIndicator()) // Fica carregando enquanto API não responde (fdp carrega logo)
                    : _petImageUrl != null
                        ? Image.network(
                            _petImageUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(child: CircularProgressIndicator());
                            },
                          )
                        : const Center(child: Text('Nenhum pet encontrado.')),
              ),
            ),
            
            const SizedBox(height: 16),
//____________________________________BOTÃO PARA CHAMAR A API NOVAMENTE______________________________________
            ElevatedButton.icon(
              onPressed: _buscarPetDoDia,
              icon: const Icon(Icons.refresh),
              label: const Text('Ver outro focinho'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



