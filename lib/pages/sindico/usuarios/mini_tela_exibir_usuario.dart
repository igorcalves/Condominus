import 'package:flutter/material.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';

AlertDialog telaDeDadosUsuario(User user, BuildContext context) {
  return AlertDialog(
    title: TextoPersonalizado(
      user.name!,
      tamanho: 16,
      opacidade: 1,
    ),
    backgroundColor: Cores.corDoAlertDialog(opacidade: 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    contentPadding: EdgeInsets.zero,
    content: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        user.toString(),
        style: TextStyle(color: Cores.corDoTextoPrincipal(), fontSize: 14),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const TextoPersonalizado('OK'),
      ),
    ],
  );
}
