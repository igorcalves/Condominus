import 'dart:convert';

import 'package:Condominus/componentes/frame_superior_busca.dart';
import 'package:Condominus/componentes/frame_tile.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/abrir_info_usuarios.dart';
import 'package:Condominus/pages/sindico/visitantes/sub_tela_editar_criar_visitante.dart';
import 'package:Condominus/provider/visitante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaParaGerenciarVisitantes extends StatelessWidget {
  const TelaParaGerenciarVisitantes({super.key});

  @override
  Widget build(BuildContext context) {
    VisitantesProvider visitantesProvider =
        Provider.of<VisitantesProvider>(context, listen: false);

    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff89c5fd),
            brightness: Brightness.dark,
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.white.withOpacity(0.4),
            selectionHandleColor: Colors.blue,
          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: Cores.gradientePrincipal(),
            child: Column(
              children: [
                CampoDeBusca(onPressedAdicionar: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Builder(
                        builder: (BuildContext alertDialogContext) {
                          return SubTelaParaAdicionarOuAtualizarVisitantes(
                              botaoDeEnviar: 'Criar',
                              onPressedCriarAtualizar:
                                  (Visitantes visitanteParaAdicionar) {
                                visitantesProvider
                                    .criarVisitante(visitanteParaAdicionar);
                              },
                              titulo: "Registro");
                        },
                      );
                    },
                  );
                }, onPressedPesquisa: (String text) {
                  visitantesProvider.escolherTipoDeBusca(text);
                  visitantesProvider.trocarEstadoCarregamento();
                }),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(child: CorpoDaTelaDeBusca()),
              ],
            )),
      ),
    );
  }
}

class CorpoDaTelaDeBusca extends StatelessWidget {
  const CorpoDaTelaDeBusca({super.key});

  @override
  Widget build(BuildContext context) {
    VisitantesProvider visitantesProvider =
        Provider.of<VisitantesProvider>(context);
    List<Visitantes> visitantes = visitantesProvider.buscarTodos();
    if (visitantesProvider.estaCarregando) {
      return const Center(child: CircularProgressIndicator());
    } else if (visitantesProvider.deuErro) {
      return TextoPersonalizado(
        visitantesProvider.msgErro,
        tamanho: 12,
      );
    } else {
      return ListView.builder(
          itemCount: visitantes.length,
          itemBuilder: ((context, index) {
            var visitante = visitantes[index];
            return ListTile(
              title: FrameTile(
                estaAtivo: true,
                titulo: AlertaDeDados(
                  text: visitante.name!,
                  visitante: visitante,
                ),
                subTitulo: Row(
                  children: [
                    const Icon(Icons.chevron_right),
                    AlertaDeDados(
                      text: visitante.user!.pegarNomeESobrenome(),
                      user: visitante.user,
                    ),
                  ],
                ),
                onPressedIconeEditar: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Builder(
                        builder: (BuildContext alertDialogContext) {
                          return SubTelaParaAdicionarOuAtualizarVisitantes(
                              visitante: visitante,
                              botaoDeEnviar: 'Editar',
                              onPressedCriarAtualizar:
                                  (Visitantes visitanteParaeditar) {
                                visitantesProvider
                                    .editarVisitante(visitanteParaeditar);
                              },
                              titulo: "Atualizar");
                        },
                      );
                    },
                  );
                },
                onPressedIconeDeletar: () {
                  visitantesProvider.trocarEstadoCarregamento();
                  visitantesProvider.deletarVisitante(visitante.cpf!);
                },
              ),
            );
          }));
    }
  }
}
