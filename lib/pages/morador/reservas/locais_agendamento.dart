import 'package:Condominus/componentes/frame_tile.dart';
import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/dominio/entidades/reserva.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/morador/reservas/carregamento_lista_reservas.dart';
import 'package:Condominus/pages/morador/reservas/sub_tela_criarReserva.dart';
import 'package:Condominus/provider/reservar_provider.dart';
import 'package:flutter/material.dart';

class EscolherLocalAgendamento extends StatelessWidget {
  const EscolherLocalAgendamento({
    super.key,
    required this.reservaProvider,
  });

  final ReservaProvider reservaProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        onPressedCriarAtualizar: (Reserva reserva) {
                          reservaProvider.criarReserva(reserva, '47776777777');
                        },
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
                        onPressedCriarAtualizar: (Reserva reserva) {
                          reservaProvider.criarReserva(reserva, '47776777777');
                        },
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
                        onPressedCriarAtualizar: (Reserva reserva) {
                          reservaProvider.criarReserva(reserva, '47776777777');
                        },
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
                        onPressedCriarAtualizar: (Reserva reserva) {
                          reservaProvider.criarReserva(reserva, '47776777777');
                        },
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
        ElevatedButton(
            onPressed: () {
              reservaProvider.carregarTodos('47776777777');
            },
            child: const TextoPersonalizado('Carregar')),
        // Botão de CONFIRMAR:
        ListaDeReservas(reservaProvider: reservaProvider),
      ],
    );
  }
}
