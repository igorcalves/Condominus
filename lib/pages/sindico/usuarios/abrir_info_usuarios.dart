import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/mini_tela_exibir_usuario.dart';
import 'package:flutter/material.dart';

class AlertaDeDados extends StatelessWidget {
  const AlertaDeDados(
      {super.key, this.user, this.visitante, required this.text});

  final User? user;
  final String text;
  final Visitantes? visitante;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            if (user != null) {
              return telaDeDadosUsuario(user: user, context: context);
            } else {
              return telaDeDadosUsuario(visitante: visitante, context: context);
            }
          },
        );
      },
      child: TextoPersonalizado(
        text,
        tamanho: 14,
      ),
    );
  }
}
