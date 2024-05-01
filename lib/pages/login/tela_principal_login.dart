import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/pages/tela_principal.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaDeLogin extends StatelessWidget {
  const TelaDeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider usersProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        decoration: Cores.gradientePrincipal(),
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await usersProvider.escolherTipoDeBusca('47776777777');
              var usuario = usersProvider.buscarTodos();
              usersProvider.zerarLista();
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaPrincipalSindico(
                      user: usuario![0],
                    ),
                  ),
                );
              }
            },
            child: const Text('Entrar'),
          ),
        ),
      ),
    );
  }
}
