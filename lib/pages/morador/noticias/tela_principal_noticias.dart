import 'package:Condominus/componentes/card_noticias.dart';
import 'package:Condominus/dominio/formatadores.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/morador/noticias/array_de_noticias.dart';
import 'package:flutter/material.dart';

class TelaDeNoticias extends StatelessWidget {
  const TelaDeNoticias({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                decoration: Cores.gradientePrincipal(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70.0),
                    Column(
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextoPersonalizado("Notícias:"),
                                const SizedBox(height: 15.0),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextoPersonalizado(
                                          DateFormatBR.dateFormat(
                                              DateTime.now().toString()))
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                SizedBox(
                                    height: 430,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: arrayDeNoticias().length,
                                        itemBuilder: (context, index) {
                                          Noticia noticia =
                                              arrayDeNoticias()[index];

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0, left: 10.0),
                                            child: CardDeNoticias(
                                              titulo: noticia.titulo,
                                              nomeDaImagem: noticia.nomeImagem,
                                              texto: noticia.texto,
                                            ),
                                          );
                                        })),
                              ],
                            ))
                      ],
                    )
                  ],
                ))));
  }
}
