import 'package:Condominus/componentes/frame_usuario.dart';
import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/main.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget(this.users, {super.key});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(decoration: Cores.gradientePrincipal()),
          ),
          body: Container(
            decoration: Cores.gradientePrincipal(),
            child: Container(
              decoration: Cores.gradientePrincipal(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    TextoBuscarUsuario(),
                    Expanded(child: listarOsUsuariosNaTela(users)),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

ListView listarOsUsuariosNaTela(List<User> users) {
  return ListView.builder(
    itemCount: users.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: FrameDeDadosPessoa(pegarUsuarios()[index]),
      );
    },
  );
}
