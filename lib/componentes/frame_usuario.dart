import 'package:flutter/material.dart';
import 'package:Condominus/pages/usuarios/sub_tela_criar_usuario.dart';
import 'package:Condominus/pages/usuarios/tela_exibir_usuario.dart';
import '/buscarMorador/User.dart';
import '/componentes/icones_prontos.dart';
import '/modelosDoApp/modelo_texto.dart';

// ignore: must_be_immutable
class FrameDeDadosPessoa extends StatelessWidget {

  User user;

FrameDeDadosPessoa(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                    context: context,
                    builder: (_) {
                      return telaDeDadosUsuario(user);
                    },
                  );
          },
          child: Row(
            children: [
              const SizedBox(
                width: 60,
                height: 60,

                child: IconePerfil(),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextoPersonalizado(user.name),
                  TextoPersonalizado(user.cpf,tamanho: 14,)
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        IconeEditar(onPressed: (){
          showDialog(
                    context: context,
                    builder: (_) {
                      return telaParaAdicionarPessoas(context,'Atualizar Cadastro',user: user);
                    },
                  );

        }),
        IconeDeletar(onPressed: (){
            


        }),
      ],
    );

  }
}
