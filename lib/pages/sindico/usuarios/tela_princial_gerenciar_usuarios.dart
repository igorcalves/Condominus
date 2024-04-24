import 'package:Condominus/componentes/frame_superior_busca.dart';
import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/componentes/frame_tile.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/abrir_info_usuarios.dart';
import 'package:Condominus/pages/sindico/usuarios/sub_tela_editar_criar_usuario.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  var users;

  AppWidget({super.key});
  TextEditingController controladorDeTexto = TextEditingController();

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
              const Expanded(child: CorpoDaTelaDeBusca()),
            ],
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
            title: FrameTile(
              titulo: AlertaDeDados(
                text: users[index].pegarNomeESobrenome(),
                user: users[index],
              ),
              subTitulo: AlertaDeDados(
                user: users[index],
                text: 'Nº apt ${users[index].apartmentNumber!}',
              ),
              onPressedIconeEditar: () {
                _funcionalidadeDoBotaoEditar(context, users, index);
              },
              onPressedIconeDeletar: () {
                usersProvider.deletarUsuario(users[index].cpf!);
              },
              onPressedIconeReverter: () {
                usersProvider.ativarUsuario(users[index].cpf!);
              },
              estaAtivo: users[index].enable!,
            ),
          );
        },
      );
    } else {
      return const Text('Nenhum Usuario Encontrado!');
    }
  }

  Future<dynamic> _funcionalidadeDoBotaoEditar(
      BuildContext context, List<User> users, int index) {
    UserProvider usersProvider =
        Provider.of<UserProvider>(context, listen: false);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Builder(
          builder: (BuildContext alertDialogContext) {
            return SubTelaParaAdicionarOuAtualizar(
                onPressedEditar: (User user) {
                  usersProvider.trocarEstadoCarregamento();
                  usersProvider.atualizarUsuario(user);
                },
                titulo: "Atualizar Cadastro",
                user: users[index]);
          },
        );
      },
    );
  }
}
