import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/abrir_info_usuarios.dart';
import 'package:Condominus/pages/sindico/visitantes/sub_tela_editar_criar_visitante.dart';
import 'package:Condominus/provider/visitante_provider.dart';
import 'package:flutter/material.dart';

class FrameTile extends StatelessWidget {
  final bool estaAtivo;
  final Widget titulo;
  final Widget subTitulo;
  final VoidCallback? onPressedIconeEditar;
  final VoidCallback? onPressedIconeDeletar;
  final VoidCallback? onPressedIconeReverter;

  const FrameTile(
      {super.key,
      required this.estaAtivo,
      required this.titulo,
      required this.subTitulo,
      this.onPressedIconeEditar,
      this.onPressedIconeDeletar,
      this.onPressedIconeReverter});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: iconeDePerfil(),
      title: titulo,
      subtitle: subTitulo,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (estaAtivo) IconeEditar(onPressed: onPressedIconeEditar),
          if (estaAtivo) IconeDeletar(onPressed: onPressedIconeDeletar),
          if (estaAtivo == false && onPressedIconeEditar != null)
            IconeDeReverterDelecao(onPressed: onPressedIconeReverter)
        ],
      ),
    );
  }
}

class FrameTileReservas extends StatelessWidget {
  final String texto;
  final Icon icone;
  final VoidCallback? onPressedAgendamento;

  const FrameTileReservas(
      {required this.texto,
      required this.icone,
      super.key,
      required this.onPressedAgendamento});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedAgendamento,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(left: 10.0, right: 70.0),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(121, 11, 67, 172).withOpacity(0.6),
                  spreadRadius: 1.0,
                  blurRadius: 3.0,
                  offset: const Offset(2, 8)),
            ]),
        padding: const EdgeInsets.all(12.0),
        child: Row(children: [
          const SizedBox(width: 5.0),
          icone,
          const SizedBox(width: 10.0),
          TextoPersonalizado(
            texto,
            tamanho: 17,
          )
        ]),
      ),
    );
  }
}

class TileDeVisitante extends StatelessWidget {
  const TileDeVisitante({
    super.key,
    required this.visitante,
    required this.visitantesProvider,
  });

  final Visitantes visitante;
  final VisitantesProvider visitantesProvider;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: FrameTile(
        estaAtivo: true,
        titulo: AlertaDeDados(
          text: visitante.name!,
          visitante: visitante,
        ),
        subTitulo: Row(
          children: [
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
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
                        visitantesProvider.editarVisitante(visitanteParaeditar);
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
  }
}
