import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/mini_tela_exibir_usuario.dart';
import 'package:flutter/material.dart';

class alertaDeDados extends StatelessWidget {
  const alertaDeDados({super.key, required this.user, required this.text});

  final User user;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return telaDeDadosUsuario(user, context);
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
