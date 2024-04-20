import 'package:Condominus/componentes/frame_superior_busca.dart';
import 'package:Condominus/componentes/frame_tile.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/abrir_info_usuarios.dart';
import 'package:flutter/material.dart';

class TelaPrincipalVisitantes extends StatelessWidget {
  const TelaPrincipalVisitantes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: Scaffold(
        body: Container(
            decoration: Cores.gradientePrincipal(),
            child: Column(
              children: [
                CampoDeBusca(
                    onPressedAdicionar: () =>
                        print('Estou na tela de visitante'),
                    onPressedPesquisa: (String text) {
                      print('asdasdas');
                    }),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: CorpoDaTelaDeBusca()),
              ],
            )),
      ),
    );
  }
}

class CorpoDaTelaDeBusca extends StatelessWidget {
  User johnDoe = User(
    name: "John Doe",
    cpf: "123.456.789-00",
    phone: "(00) 12345-6789",
    role: "resident",
    email: "john.doe@example.com",
    senha: "senha123",
    birthDay: "1980-12-12",
    condominiumPrice: 1000.00,
    apartmentNumber: "101",
    enable: true,
  );

  User visitante = User(
    name: "visitante Doe",
    cpf: "123.456.789-00",
    phone: "(00) 12345-6789",
    role: "visitante",
    email: "john.doe@example.com",
    senha: "senha123",
    birthDay: "1980-12-12",
    condominiumPrice: 1000.00,
    apartmentNumber: "101",
    enable: true,
  );
  CorpoDaTelaDeBusca({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: ((context, index) {
          return ListTile(
            title: FrameTile(
              estaAtivo: true,
              titulo: alertaDeDados(
                  text: 'Visitante da silva $index', user: visitante),
              subTitulo: Row(
                children: [
                  const Icon(Icons.chevron_right),
                  alertaDeDados(text: 'Jonh', user: johnDoe),
                ],
              ),
              onPressedIconeEditar: () {
                print('fui pressionado');
              },
              onPressedIconeDeletar: () {
                print('fui pressionado');
              },
              onPressedIconeReverter: () {
                print('fui pressionado');
              },
            ),
          );
        }));
  }
}
