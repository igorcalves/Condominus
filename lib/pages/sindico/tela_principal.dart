import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/tela_princial_gerenciar_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TelaPrincipalSindico extends StatefulWidget {
  const TelaPrincipalSindico({super.key});

  @override
  State<TelaPrincipalSindico> createState() => _TelaPrincipalSindicoState();
}

class _TelaPrincipalSindicoState extends State<TelaPrincipalSindico> {
  int _selectedIndex = 0;

  final List<Widget> _telas = [TelaPrincipal(), AppWidget()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: TileUsuarioAppBar(),
          flexibleSpace: Container(
            decoration: Cores.gradientePrincipal(),
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            decoration: Cores.gradientePrincipal(),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 300,
                  child: const DrawerHeader(child: TextoPersonalizado('Menu')),
                ),
                ListTile(
                  title: const TextoPersonalizado('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const TextoPersonalizado('Item 2'),
                  onTap: () {},
                ),
                ListTile(
                  title: TextoPersonalizado('Item 3'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: _telas[_selectedIndex],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Cor de fundo do container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Sombra
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, -3), // Deslocamento da sombra
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.blue.withOpacity(0.5),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Início',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Moradores',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Perfil',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.blue,
                onTap: _onItemTapped,
              ),
            ),
          ],
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
            icon: Icon(
              Icons.account_circle,
              size: 40,
            )),
        TextoPersonalizado('Nome Sindico')
      ],
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: Cores.gradientePrincipal(),
          child: Center(
            child: Image.asset('assets/imagens/logoBranco.png'),
          ),
        ),
      ),
    );
  }
}
