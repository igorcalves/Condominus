import 'package:Condominus/componentes/frame_superior_busca.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/pages/sindico/usuarios/corpo_tela_usuarios.dart';
import 'package:Condominus/pages/sindico/usuarios/sub_tela_editar_criar_usuario.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaParaGerenciarMoradores extends StatelessWidget {
  TelaParaGerenciarMoradores({super.key});
  final TextEditingController controladorDeTexto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider usersProvider =
        Provider.of<UserProvider>(context, listen: false);
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
          child: Column(
            children: [
              CampoDeBusca(
                onPressedAdicionar: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Builder(
                        builder: (BuildContext alertDialogContext) {
                          return SubTelaParaAdicionarOuAtualizar(
                              botaoDeEnviar: 'Criar',
                              onPressedEditar: (User user) {
                                usersProvider.trocarEstadoCarregamento();
                                usersProvider.criarUsuario(user);
                              },
                              titulo: "Registro");
                        },
                      );
                    },
                  );
                },
                onPressedPesquisa: (String textoDeBusca) {
                  final UserProvider users =
                      Provider.of(context, listen: false);
                  users.escolherTipoDeBusca(textoDeBusca);
                  users.trocarEstadoCarregamento();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(child: CorpoDaTelaDeGerenciarUsuario()),
            ],
          ),
        ),
      ),
    );
  }
}
