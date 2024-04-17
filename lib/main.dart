import 'package:Condominus/pages/sindico/tela_principal.dart';
import 'package:Condominus/pages/sindico/usuarios/tela_princial_gerenciar_usuarios.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:Condominus/repository/fake_repository.dart';
import 'package:Condominus/repository/repositorio_principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(AppWidget(pegarUsuarios()));
  //runApp(TelaPrincipalSindico());

  String linux = 'http://192.168.0.90:8080';

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(RepositorioPrincipal(linux)),
      //create: (context) => UserProvider(FakeRepository()),
    ),
  ], child: TelaPrincipalSindico()));

  //runApp(AppWidget());
}
