import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:flutter/material.dart';


class FrameTile extends StatelessWidget {


  final bool estaAtivo;
  final Widget titulo;
  final Widget subTitulo;
  final VoidCallback? onPressedIconeEditar;
  final VoidCallback? onPressedIconeDeletar;
  final VoidCallback? onPressedIconeReverter;




  const FrameTile({super.key, required this.estaAtivo,
  required this.titulo,
  required this.subTitulo,
  required this.onPressedIconeEditar,
  required this.onPressedIconeDeletar,
  required this.onPressedIconeReverter
  
  });

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
          if (estaAtivo)
            IconeEditar(
              onPressed: onPressedIconeEditar
            ),
          if (estaAtivo)
            IconeDeletar(
              onPressed: onPressedIconeDeletar
            ),
          if (estaAtivo == false)
            IconeDeReverterDelecao(
              onPressed: onPressedIconeReverter
            )
        ],
      ),
    );
  }
}

