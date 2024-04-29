import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/morador/reservas/tela_reservas.dart';
import 'package:Condominus/pages/sindico/tela_do_logo.dart';
import 'package:Condominus/pages/sindico/usuarios/tela_princial_gerenciar_usuarios.dart';
import 'package:Condominus/pages/sindico/visitantes/tela_principal_gerenciar_visitantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class TelaPrincipalSindico extends StatelessWidget {
  TelaPrincipalSindico({super.key});

  final _pageControlller = PageController();

  void dispose() {
    _pageControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt')],
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const TileUsuarioAppBar(),
          flexibleSpace: Container(decoration: Cores.gradienteAppBar()),
        ),
        body: PageView(
          controller: _pageControlller,
          children: <Widget>[
            TelaDeReservaDeMoradores(),
            TelaParaGerenciarMoradores(),
            const TelaParaGerenciarVisitantes()
          ],
        ),
        extendBody: true,
        bottomNavigationBar: RollingBottomBar(
          color: const Color.fromARGB(255, 255, 240, 219),
          controller: _pageControlller,
          flat: true,
          useActiveColorByDefault: false,
          items: const [
            RollingBottomBarItem(Icons.home, activeColor: Colors.blue),
            RollingBottomBarItem(Icons.person, activeColor: Colors.blueAccent),
            RollingBottomBarItem(Icons.groups, activeColor: Colors.blue),
          ],
          enableIconRotation: true,
          onTap: (index) {
            _pageControlller.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}

class TileUsuarioAppBar extends StatelessWidget {
  const TileUsuarioAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              size: 40,
            )),
        const TextoPersonalizado('Nome Sindico')
      ],
    );
  }
}
