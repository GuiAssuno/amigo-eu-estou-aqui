import 'package:flutter/material.dart';


class DetalheVaga extends StatelessWidget {
  const DetalheVaga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EE),
//=====================================================================================================================        
//===================================================        APPBAR       =============================================        
//=====================================================================================================================  
      appBar: AppBar( 
        title: const Text('Vaga de voluntariado'),
        backgroundColor: const Color(0xFF394867),
        foregroundColor: Colors.white,
      ),

//=====================================================================================================================        
//===================================================        CORPO        =============================================        
//=====================================================================================================================  
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
//__________________________________________________________TITULO_____________________________________________________
            Container( 
              width: double.infinity, 
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(43, 0, 0, 0),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Titulo',                                  // Titulo
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
                  ),
                  const SizedBox(height: 4),
                  
                  Text('ONG',                                     // Subtitulo 
                    style: const TextStyle(color: Color(0xFF394867), fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 16),



//=====================================================================================================================        
//===================================================        INFORMAÇÕES        =======================================     
//=====================================================================================================================  
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE0D5C8)),
              ),
              child: Column(
                children: [
//___________________________________________________________LOCALIZAÇÃO________________________________________________
                  Info(icon: Icons.location_on_outlined, label: 'Localização',      value: 'Rua: Dos bobos, N° 0'),
                  const Divider(height: 20),
//_________________________________________________________DIAS_DISPONIVEIS_____________________________________________
                  Info(icon: Icons.schedule_outlined,   label: 'Disponibilidade',   value: 'Segunda a sexta, 9h às 17h'),
                  const Divider(height: 20),
//__________________________________________________________NUMERO_DE_VAGAS______________________________________________
                  Info(icon: Icons.people_outline,      label: 'Vagas disponíveis', value: '${10000} vagas',),
                ],
              ),
            ),
            const SizedBox(height: 16),
//=====================================================================================================================        
//===================================================        LINHA SOBRE       ========================================        
//=====================================================================================================================  
            const Text('Sobre a vaga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              'descricao',
              style: const TextStyle(fontSize: 15, color: Color(0xFF5F5E5A), height: 1.7),
            ),
            const SizedBox(height: 32),

//=====================================================================================================================        
//===================================================        BOTÕES       =============================================        
//=====================================================================================================================  
            
            SizedBox(//------------------------------>   botão inscrição
              width: double.infinity,
              child: ElevatedButton.icon(  
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: Text('Inscrição realizada!' ),
                      content: Text(
                        'Você se inscreveu como voluntário',
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF394867),
                          ),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon( Icons.handshake_outlined),
                label: Text('Quero ser voluntário!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF394867),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            SizedBox(//------------------------------>   botão compartilhar
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Vaga compartilhada! 🔗'),
                      backgroundColor: Color(0xFF394867),
                    ),
                  );
                },
                icon: const Icon(Icons.share_outlined),
                label: const Text('Compartilhar esta vaga'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF394867),
                  side: const BorderSide(color: Color(0xFF394867)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//=====================================================================================================================        
//===================================================        INFO       =============================================        
//=====================================================================================================================  
class Info extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const Info({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF394867), size: 22), // ícone da informação
        const SizedBox(width: 12),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF888780))), // rótulo da informação
            Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),// informação
          ],
        ),
      ],
    );

  }
}
