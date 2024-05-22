import 'package:Condominus/dominio/entidades/auth.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/dominio/validadores.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/modelosDoApp/modelos_text_field.dart';
import 'package:Condominus/pages/tela_principal.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaDeLogin extends StatelessWidget {
  TelaDeLogin({super.key});
  final _formKey = GlobalKey<FormState>();
  final validador = Validar();
  final TextEditingController loginControler = TextEditingController();
  final TextEditingController senhaControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider usersProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: Cores.gradientePrincipal(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Image.asset('assets/imagens/logoBranco.png'),
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 280,
                          child: campoDeTextoCadastro(
                            controller: loginControler,
                            campo: 'Login',
                            textoErro: 'Login Inválido',
                            validacao: (String text) => text.isEmpty,
                          ),
                        ),
                        SizedBox(
                          width: 280,
                          child: campoDeTextoCadastro(
                            controller: senhaControler,
                            campo: 'Senha',
                            textoErro: 'Senha Inválida',
                            validacao: (String text) => text.isEmpty,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () async {
                            loginControler.text = 'morador';
                            senhaControler.text = '123';
                            await usersProvider.login(AuthDto(
                                login: loginControler.text,
                                password: senhaControler.text));

                            if (_formKey.currentState!.validate()) {
                              if (context.mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaPrincipalSindico(
                                        user: usersProvider.getUser()),
                                  ),
                                );
                              }
                            }
                          },
                          child: const TextoPersonalizado('Entrar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
