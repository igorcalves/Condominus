import 'package:Condominus/componentes/frame_usuarios.dart';
import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  var users;

  controlarEstado({Function Function()? buscarUsarios}) async {
    () => buscarUsarios!();
    print('ta indo');
  }

  bool carregamento = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff89c5fd),
            brightness: Brightness.dark,
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.white.withOpacity(0.4),
            selectionHandleColor: Colors.blue,
          )),
      home: Scaffold(
        body: Container(
          decoration: Cores.gradientePrincipal(),
          child: Container(
            decoration: Cores.gradientePrincipal(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                children: [
                  TextoBuscarUsuario(
                    controlarEstado: () => controlarEstado(),
                  ),
                  carregamento
                      ? const Expanded(
                          child: Center(
                          child: CircularProgressIndicator(),
                        ))
                      : Expanded(
                          child: listarOsUsuariosNaTela(context, users),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget listarOsUsuariosNaTela(BuildContext context, var users) {
  return users != null
      ? ListView.builder(
          itemCount: users.lengt,
          itemBuilder: (context, index) {
            return ListTile(
              title: FramePessoa(user: users[index]),
            );
          },
        )
      : const Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('Nenhum Usuario Encontrado!'),
          ],
        );
}
