import 'package:Condominus/componentes/frame_superior_busca.dart';
import 'package:Condominus/modelosDoApp/modelos_textField.dart';
import 'package:Condominus/componentes/frame_usuarios.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  var users;

  AppWidget({super.key});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              children: [
                CampoDeBusca(),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(child: CorpoDaTelaDeBusca()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CorpoDaTelaDeBusca extends StatelessWidget {
  const CorpoDaTelaDeBusca({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider usersProvider = Provider.of<UserProvider>(context);

    var users = usersProvider.buscarTodos();
    if (usersProvider.estaCarregando) {
      return const Center(child: CircularProgressIndicator());
    } else if (usersProvider.deuErro) {
      return TextoPersonalizado(usersProvider.msgErro);
    } else if (users != null) {
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: FramePessoa(user: users[index]),
          );
        },
      );
    } else {
      return const Text('Nenhum Usuario Encontrado!');
    }
  }
}
