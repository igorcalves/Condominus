import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/mini_tela_exibir_usuario.dart';
import 'package:Condominus/pages/sindico/usuarios/sub_tela_editar_criar_usuario.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FramePessoa extends StatelessWidget {
  final User user;

  const FramePessoa({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    UserProvider users = Provider.of(context);

    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: AbrirInfo(
        user: user,
        text: user.name!,
      ),
      subtitle: AbrirInfo(
        user: user,
        text: 'Nº apt ${user.apartmentNumber!}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (user.enable!)
            IconeEditar(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Builder(
                      builder: (BuildContext alertDialogContext) {
                        return telaParaAdicionarPessoas(
                            alertDialogContext, "Atualizar Cadastro",
                            user: user);
                      },
                    );
                  },
                );
              },
            ),
          if (user.enable!)
            IconeDeletar(
              onPressed: () {
                users.deletarUsuario(user.cpf!);
              },
            ),
          if (user.enable! == false) const IconeDeReverterDelecao()
        ],
      ),
    );
  }
}

class AbrirInfo extends StatelessWidget {
  const AbrirInfo({super.key, required this.user, required this.text});

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
