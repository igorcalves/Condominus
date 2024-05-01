import 'package:Condominus/pages/login/tela_principal_login.dart';
import 'package:Condominus/pages/tela_principal.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:Condominus/provider/reservar_provider.dart';
import 'package:Condominus/provider/visitante_provider.dart';
import 'package:Condominus/repository/repositorio_Morador.dart';
import 'package:Condominus/repository/repositorio_revervas.dart';
import 'package:Condominus/repository/repositorio_visitantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(AppWidget(pegarUsuarios()));
  //runApp(TelaPrincipalSindico());

  String linux = 'http://192.168.0.90:8080';

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(RepositorioPrincipal(linux)),
          //create: (context) => UserProvider(FakeRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => VisitantesProvider(RepositorioVisitantes(linux)),
          //create: (context) => UserProvider(FakeRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => ReservaProvider(RepositorioDeReservas(linux)),
          //create: (context) => UserProvider(FakeRepository()),
        ),
      ],
      child: MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('pt')
          ],
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xff89c5fd),
                brightness: Brightness.dark,
              ),
              textSelectionTheme: TextSelectionThemeData(
                selectionColor: Colors.white.withOpacity(0.4),
                selectionHandleColor: Colors.blue,
              )),
          debugShowCheckedModeBanner: false,
          home: const TelaDeLogin())));

  //runApp(AppWidget());
}
