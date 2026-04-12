import 'package:flutter/material.dart';

class TelaCadastrar extends StatefulWidget {
  final int tipoUser;
  const TelaCadastrar({super.key, required this.tipoUser });

  @override
  State<TelaCadastrar> createState() => _TelaCadastrarState();
}

class _TelaCadastrarState extends State<TelaCadastrar> {
  final _formKey = GlobalKey<FormState>();
  final _cnpjCtrl = TextEditingController();
  final _nomeCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _telefoneCtrl = TextEditingController();
  final _senhaCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _senhaOculta = true;
  bool _confirmOculta = true;
  bool _carregando = false;


  @override
  void dispose() {
    _nomeCtrl.dispose();
    _emailCtrl.dispose();
    _telefoneCtrl.dispose();
    _senhaCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _cadastrar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _carregando = true);
    setState(() => _carregando = false);
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFE7DFD5),
      appBar: AppBar(
        title: const Text('Criar conta'),
        backgroundColor: const Color(0xFF84A9AC),
        foregroundColor: Colors.white,
      ),

      
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const Row(
                      children: [
                        Text(
                          'Crie sua conta',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

//=================================================================================================
//==============================   COLUNA DAS CAIXA DE TEXTO   ====================================
//=================================================================================================
                    Column(
                      children: [
// _______________________________________________CNPJ_____________________________________________
                        Visibility(
                          visible: widget.tipoUser == 1,
                          child: TextFormField(               
                            controller: _cnpjCtrl,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              labelText: 'CNPJ',
                              prefixIcon: Icon(Icons.maps_home_work_outlined),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
// ______________________________________________NOME______________________________________________        
                        TextFormField(
                          controller: _nomeCtrl,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Nome completo *',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Informe seu nome.' : null,
                        ),
                        const SizedBox(height: 14),
// ____________________________________________E-MAIL______________________________________________
                        TextFormField(
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'E-mail *',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Informe seu e-mail.';
                            final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!regex.hasMatch(v)) return 'E-mail inválido.';
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
// ___________________________________________TELEFONE_____________________________________________
                        TextFormField(
                          controller: _telefoneCtrl,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Telefone *',
                            prefixIcon: Icon(Icons.phone_outlined),
                            border: OutlineInputBorder(),
                            hintText: '(00) 00000-0000',
                          ),
                          validator: (v) => (v == null || v.trim().isEmpty) ? 'Informe seu telefone.' : null,
                        ),
                        const SizedBox(height: 14),
// _____________________________________________SENHA______________________________________________
                        TextFormField(
                          controller: _senhaCtrl,
                          obscureText: _senhaOculta,
                          decoration: InputDecoration(
                            labelText: 'Senha *',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_senhaOculta ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => _senhaOculta = !_senhaOculta),
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Informe uma senha.';
                            if (v.length < 6) return 'Mínimo 6 caracteres.';
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
// _________________________________________CONFIRMAR SENHA________________________________________
                        TextFormField(
                          controller: _confirmCtrl,
                          obscureText: _confirmOculta,
                          decoration: InputDecoration(
                            labelText: 'Confirmar senha *',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_confirmOculta ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => _confirmOculta = !_confirmOculta),
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Confirme sua senha.';
                            if (v != _senhaCtrl.text) return 'As senhas não coincidem.';
                            return null;
                          },
                        ),
                        //const SizedBox(height: 170),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

//=================================================================================================
//===================================      BOTÃO CRIAR CONTA      =================================
//=================================================================================================
          Container(
            padding: const EdgeInsets.all(24), // Dá um respiro ao redor dos botões
            decoration: const BoxDecoration(
              color: Color(0xFFE7DFD5), // Mesma cor do fundo da tela para ficar invisível
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle( backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 110, 168, 173)), ), 
                    onPressed: _carregando ? null : _cadastrar,
                    child: _carregando
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Color(0xff84A9AC), strokeWidth: 2),
                          )
                        : const Text(
                          'Criar conta', 
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow( 
                                offset: Offset(1, 0.5), 
                                blurRadius: 1,
                                color: Color(0XFF000000),
                              )
                            ],
                          )
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                
//=================================================================================================
//====================================      JA TENHO CONTA     ====================================
//=================================================================================================
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Já tenho conta → Entrar',
                        style: TextStyle(color: Color(0xFF204051), fontSize: 13)),
                  ),
                ),
              ],
            ),
//------------------------------------------------------------------------------------------------
          ),

        ]
      ),
    );
  }
}
