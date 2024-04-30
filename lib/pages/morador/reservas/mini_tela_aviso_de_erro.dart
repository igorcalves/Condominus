import 'package:flutter/material.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';

AlertDialog subDeTelaErro({String? textoErro, BuildContext? context}) {
  return AlertDialog(
    title: const TextoPersonalizado(
      'Erro Ao Criar Reserva',
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
          textoErro!,
          style: const TextStyle(fontSize: 18),
        )),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context!).pop();
        },
        child: const TextoPersonalizado('OK'),
      ),
    ],
  );
}
