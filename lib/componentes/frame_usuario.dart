import 'package:flutter/material.dart';
import '/buscarMorador/User.dart';
import '/componentes/icones_prontos.dart';
import '/modelosDoApp/modelo_texto.dart';

class FrameDeDadosPessoa extends StatelessWidget {

  List<User> users;
 int index;
 
 FrameDeDadosPessoa({ required this.users, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap: () {
            print(users[index]);
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
                  TextoPersonalizado(users[index].name),
                  TextoPersonalizado(users[index].cpf)
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        IconeEditar(onPressed: (){}),
        IconeDeletar(onPressed: (){print(users[index]);}),
      ],
    );

  }
}
