import 'dart:convert';

import 'package:Condominus/componentes/frame_superior_busca.dart';
import 'package:Condominus/componentes/frame_tile.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/abrir_info_usuarios.dart';
import 'package:Condominus/pages/sindico/visitantes/sub_tela_editar_criar_visitante.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:Condominus/provider/visitante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaParaGerenciarVisitantes extends StatelessWidget {
  const TelaParaGerenciarVisitantes({super.key});

  @override
  Widget build(BuildContext context) {
    VisitantesProvider visitantesProvider =
        Provider.of<VisitantesProvider>(context, listen: false);
    UserProvider usersProvider =
        Provider.of<UserProvider>(context, listen: false);
    var token = usersProvider.getUser().token;

    return Scaffold(
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
                              visitantesProvider.criarVisitante(
                                  visitanteParaAdicionar, token);
                            },
                            titulo: "Registro");
                      },
                    );
                  },
                );
              }, onPressedPesquisa: (String text) {
                visitantesProvider.escolherTipoDeBusca(text, token);
                visitantesProvider.trocarEstadoCarregamento();
              }),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: CorpoDaTelaDeBusca(
                token: token,
              )),
            ],
          )),
    );
  }
}

class CorpoDaTelaDeBusca extends StatelessWidget {
  const CorpoDaTelaDeBusca({super.key, required this.token});
  final token;

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
            return TileDeVisitante(
              visitante: visitante,
              visitantesProvider: visitantesProvider,
              token: token,
            );
          }));
    }
  }
}
