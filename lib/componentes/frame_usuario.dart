import 'package:flutter/material.dart';
import 'package:Condominus/pages/usuarios/sub_tela_editar_criar_usuario.dart';
import 'package:Condominus/pages/usuarios/mini_tela_exibir_usuario.dart';
import '../dominio/user.dart';
import '/componentes/icones_prontos.dart';
import '/modelosDoApp/modelo_texto.dart';

// ignore: must_be_immutable
class FrameDeDadosPessoa extends StatelessWidget {
  User user;

  FrameDeDadosPessoa(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        title: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) {
                return telaDeDadosUsuario(user, context);
              },
            );
          },
          child: Row(
            children: [
              const IconePerfil(),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextoPersonalizado(
                      user.name!,
                    ),
                    TextoPersonalizado(
                      user.cpf!,
                      tamanho: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconeEditar(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return telaParaAdicionarPessoas(
                        context, 'Atualizar Cadastro',
                        user: user);
                  },
                );
              },
            ),
            IconeDeletar(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
