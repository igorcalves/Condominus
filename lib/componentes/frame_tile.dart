import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
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
      required this.onPressedIconeEditar,
      required this.onPressedIconeDeletar,
      this.onPressedIconeReverter});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: titulo,
      subtitle: subTitulo,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (estaAtivo) IconeEditar(onPressed: onPressedIconeEditar),
          if (estaAtivo) IconeDeletar(onPressed: onPressedIconeDeletar),
          if (estaAtivo == false)
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
