

import 'package:flutter/material.dart';
import 'package:telas/componentes/frame_usuario.dart';
import 'package:telas/componentes/icones_prontos.dart';
import 'package:telas/modelosDoApp/modelo_cores.dart';
import 'package:telas/modelosDoApp/modelo_texto.dart';
import '/buscarMorador/User.dart';


void main() {
  //runApp(AppWidget(pegarUsuarios()));
  runApp(AppWidget(pegarUsuarios()));
}





















class AppWidget extends StatelessWidget {
  AppWidget(this.users, {super.key});

  List<User> users;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Cores.corDoAppBar(),
          title: const TextoPersonalizado('Moradores',tamanho: 34.0),
        ),
        body: Container(
          decoration: Cores.gradientePrincipal(),
          child: Container(
        decoration: Cores.gradientePrincipal(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            children: [
              const TextoBuscarUsuario(),
              const SizedBox(height: 25),
              Expanded(
                child: listarOsUsuariosNaTela(users)
              ),
            ],
          ),
        ),
          ),
        )
      ),
    );
  }
}










ListView listarOsUsuariosNaTela(List<User> users){

  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: FrameDeDadosPessoa(users:pegarUsuarios(),index:index),
                        );
                      },
                    );

}


List<User> pegarUsuarios(){
   return  [
    User('Arquimonde', '1489', 25),
    User('Illidan Stormrage', '8976', 70),
    User('Kel Thuzad', '4929', 33),
    User('Lady Vashj', '5716', 100),
    User('Nefarian', '6059', 33),
    User('Onyxia', '9753', 36),
    User('Ragnaros', '6795', 62),
    User('The Lich King', '2170', 59),
    User('Yogg-Saron', '3691', 42),
    User('CThun', '5541', 23),
    User('Deathwing', '1110', 56),
    User('Garrosh Hellscream', '4829', 52),
    User('Guldan', '5758', 22),
    User('Kaelthas Sunstrider', '6045', 56),
    User('Kiljaeden', '1692', 93),
    User('Mannoroth', '7775', 31),
    User('Sargeras', '5329', 39),
    User('Sylvanas Windrunner', '7926', 65),
    User('Thrall', '7426', 78),
    User('Varian Wrynn', '9062', 39),
    User('Grommash Hellscream', '8831', 33),
    User('Malfurion Stormrage', '6799', 56),
    User('Tyrande Whisperwind', '3305', 24),
    User('Voljin', '7506', 87),
    User('Jaina Proudmoore', '5561', 45)
  ];
}