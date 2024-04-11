import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/usuarios/mini_tela_exibir_usuario.dart';
import 'package:Condominus/pages/usuarios/sub_tela_editar_criar_usuario.dart';
import 'package:flutter/material.dart';

class FramePessoa extends StatelessWidget {
  final User user;

  const FramePessoa({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: abrirInfo(
        user: user,
        text: user.name!,
      ),
      subtitle: abrirInfo(
        user: user,
        text: 'Nº apt ${user.apartmentNumber!}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconeEditar(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return telaParaAdicionarPessoas(context, 'Atualizar Cadastro',
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
    );
  }
}

class abrirInfo extends StatelessWidget {
  const abrirInfo({super.key, required this.user, required this.text});

  final User user;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
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
