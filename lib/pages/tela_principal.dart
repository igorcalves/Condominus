import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/morador/noticias/tela_principal_noticias.dart';
import 'package:Condominus/pages/morador/reservas/tela_reservas.dart';
import 'package:Condominus/pages/morador/visitantes/tela_visitante.dart';
import 'package:Condominus/pages/sindico/tela_do_logo.dart';
import 'package:Condominus/pages/sindico/usuarios/tela_princial_gerenciar_usuarios.dart';
import 'package:Condominus/pages/sindico/visitantes/tela_principal_gerenciar_visitantes.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class TelaPrincipalSindico extends StatelessWidget {
  TelaPrincipalSindico({super.key, required this.user});

  final User user;

  final _pageControlller = PageController();

  void dispose() {
    _pageControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late bool morador;

    if (user.role == 'USER') {
      morador = true;
    } else if (user.role == 'ADM') {
      morador = false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TileUsuarioAppBar(
          user: user,
        ),
        flexibleSpace: Container(decoration: Cores.gradienteAppBar()),
      ),
      body: PageView(
        controller: _pageControlller,
        children: [
          morador ? const TelaDeNoticias() : const TelaDeHome(),
          morador
              ? TelaDeReservaDeMoradores(user: user)
              : TelaParaGerenciarMoradores(),
          morador
              ? TelaDeVisitantesPorMorador(user: user)
              : const TelaParaGerenciarVisitantes()
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        color: const Color.fromARGB(255, 255, 240, 219),
        controller: _pageControlller,
        flat: true,
        useActiveColorByDefault: false,
        items: [
          const RollingBottomBarItem(Icons.home, activeColor: Colors.blue),
          RollingBottomBarItem(morador ? Icons.edit_calendar : Icons.person,
              activeColor: Colors.blueAccent),
          const RollingBottomBarItem(Icons.groups, activeColor: Colors.blue),
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
    );
  }
}

class TileUsuarioAppBar extends StatelessWidget {
  const TileUsuarioAppBar({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [TextoPersonalizado(user.name!)],
    );
  }
}
