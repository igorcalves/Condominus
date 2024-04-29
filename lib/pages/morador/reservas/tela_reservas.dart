import 'package:Condominus/componentes/frame_superior_busca.dart';
import 'package:Condominus/dominio/entidades/reserva.dart';
import 'package:Condominus/pages/morador/reservas/carregamento_lista_reservas.dart';
import 'package:Condominus/pages/morador/reservas/sub_tela_criarReserva.dart';
import 'package:Condominus/provider/reservar_provider.dart';
import 'package:flutter/material.dart';
import 'package:Condominus/componentes/frame_tile.dart';
import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:provider/provider.dart';

class TelaDeReservaDeMoradores extends StatelessWidget {
  TelaDeReservaDeMoradores({Key? key});

  String cpf = '47776777777';
  Map<String, int> areas = {
    'Churrasqueira': 0,
    'Piscina': 1,
    'Area de Trabalho': 2,
    'Salão de Festa': 5,
  };

  @override
  Widget build(BuildContext context) {
    List<String> chaves = areas.keys.toList();
    List<int> valores = areas.values.toList();
    ReservaProvider reservaProvider = Provider.of<ReservaProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            decoration: Cores.gradientePrincipal(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Áreas",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const TextoPersonalizado(
                    "Reserve espaço(s) do seu condomínio:",
                    tamanho: 15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: valores.length,
                      itemBuilder: (context, index) {
                        return FrameTileReservas(
                          icone: escolherItemDaReserva(valores[index]),
                          texto: chaves[index],
                          onPressedAgendamento: () {
                            subTela(
                                context: context,
                                reservaProvider: reservaProvider,
                                local: chaves[index],
                                cpf: cpf,
                                id: valores[index].toString());
                          },
                        );
                      },
                    ),
                  ),
                  const TextoPersonalizado(
                    "Agendamentos:",
                    tamanho: 24,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconePequisa(
                    onPressed: () {
                      reservaProvider.carregarTodos('47776777777');
                    },
                  ),
                  SizedBox(
                      height: 520,
                      child: ListaDeReservas(reservaProvider: reservaProvider)),
                  const SizedBox(
                    height: 300,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> subTela({
    required context,
    required ReservaProvider reservaProvider,
    required String local,
    required String id,
    required String cpf,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Builder(
          builder: (BuildContext alertDialogContext) {
            return SubTelaParaAdicionarReserva(
                id: id,
                local: local,
                botaoDeEnviar: 'Criar',
                onPressedCriarAtualizar: (Reserva reserva) {
                  reservaProvider.criarReserva(reserva, cpf);
                },
                titulo: "Reservas");
          },
        );
      },
    );
  }
}
