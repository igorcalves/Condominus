import 'package:Condominus/dominio/entidades/reserva.dart';
import 'package:Condominus/pages/morador/sub_tela_criarReserva.dart';
import 'package:flutter/material.dart';
import 'package:Condominus/componentes/frame_tile.dart';
import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:flutter/rendering.dart';

class TelaDeReservaDeMoradores extends StatelessWidget {
  const TelaDeReservaDeMoradores({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: Cores.gradientePrincipal(),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Áreas",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: const Icon(Icons.info_outline_rounded),
                              iconSize: 16,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        const TextoPersonalizado(
                          "Reserve espaço(s) do seu condomínio:",
                          tamanho: 15,
                        ),
                        const SizedBox(height: 20.0),
                        FrameTileReservas(
                          texto: 'Churrasqueira',
                          icone: iconeChurrassqueira(),
                          onPressedAgendamento: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Builder(
                                  builder: (BuildContext alertDialogContext) {
                                    return SubTelaParaAdicionarReserva(
                                        id: '0',
                                        local: 'Churrasqueira',
                                        botaoDeEnviar: 'Criar',
                                        onPressedCriarAtualizar:
                                            (Reserva user) {},
                                        titulo: "Reservas");
                                  },
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20.0),
                        FrameTileReservas(
                          texto: 'Piscina',
                          icone: iconePiscina(),
                          onPressedAgendamento: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Builder(
                                  builder: (BuildContext alertDialogContext) {
                                    return SubTelaParaAdicionarReserva(
                                        id: '1',
                                        local: 'Area de Trabalho',
                                        botaoDeEnviar: 'Criar',
                                        onPressedCriarAtualizar:
                                            (Reserva user) {},
                                        titulo: "Reservas");
                                  },
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20.0),
                        FrameTileReservas(
                          texto: 'Area de Trabalho',
                          icone: iconeAreaDeTrabalho(),
                          onPressedAgendamento: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Builder(
                                  builder: (BuildContext alertDialogContext) {
                                    return SubTelaParaAdicionarReserva(
                                        id: '2',
                                        local: 'Area de Trabalho',
                                        botaoDeEnviar: 'Criar',
                                        onPressedCriarAtualizar:
                                            (Reserva user) {},
                                        titulo: "Reservas");
                                  },
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20.0),
                        FrameTileReservas(
                          texto: 'Salão de festas',
                          icone: iconeSalaoDeFestas(),
                          onPressedAgendamento: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Builder(
                                  builder: (BuildContext alertDialogContext) {
                                    return SubTelaParaAdicionarReserva(
                                        id: '5',
                                        local: 'Salão de festas',
                                        botaoDeEnviar: 'Criar',
                                        onPressedCriarAtualizar:
                                            (Reserva user) {},
                                        titulo: "Reservas");
                                  },
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 41.0),
                        const TextoPersonalizado(
                          "Agendamentos:",
                          tamanho: 24,
                        ),
                        const SizedBox(height: 20.0),
                        // Botão de CONFIRMAR:
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 500,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: iconeChurrassqueira(),
                                title: TextoPersonalizado('Nome da Area'),
                                subtitle: TextoPersonalizado(
                                  'dia e hora do agendamento',
                                  tamanho: 17,
                                  opacidade: 0.4,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
