import 'package:Condominus/componentes/frame_usuarios.dart';
import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

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
                  const TextoBuscarUsuario(),
                  Expanded(
                    child: listarOsUsuariosNaTela(context),
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

ListView listarOsUsuariosNaTela(BuildContext context) {
  UserProvider userProvide = Provider.of(context);
  List<User> users = userProvide.buscarTodos();
  return ListView.builder(
    itemCount: userProvide.tamanhoDaLista(),
    itemBuilder: (context, index) {
      return ListTile(
        title: FramePessoa(user: users[index]),
      );
    },
  );
}