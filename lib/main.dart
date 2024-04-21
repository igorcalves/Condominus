import 'package:Condominus/pages/sindico/tela_principal.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:Condominus/provider/visitante_provider.dart';
import 'package:Condominus/repository/repositorio_morador.dart';
import 'package:Condominus/repository/repositorio_visitantes.dart';
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
    ChangeNotifierProvider(
      create: (context) => VisitantesProvider(RepositorioVisitantes(linux)),
      //create: (context) => UserProvider(FakeRepository()),
    ),
  ], child: TelaPrincipalSindico()));

  //runApp(AppWidget());
}
