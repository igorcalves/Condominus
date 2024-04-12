import 'package:Condominus/pages/usuarios/tela_princial_gerenciar_usuarios.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:Condominus/repository/fake_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(AppWidget(pegarUsuarios()));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(
        FakeRepository(),
      ),
    ),
  ], child: const AppWidget()));

  //runApp(AppWidget());
}
