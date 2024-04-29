import 'dart:convert';

import 'package:Condominus/dominio/entidades/reserva.dart';
import 'package:Condominus/dominio/formatadores.dart';
import 'package:Condominus/dominio/validadores.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/modelosDoApp/modelos_text_field.dart';
import 'package:flutter/material.dart';

class SubTelaParaAdicionarReserva extends StatelessWidget {
  SubTelaParaAdicionarReserva(
      {super.key,
      required this.titulo,
      required this.onPressedCriarAtualizar,
      required this.botaoDeEnviar,
      required this.local,
      required this.id});

  final String botaoDeEnviar;
  final String titulo;
  final String local;
  final String id;

  final _formKey = GlobalKey<FormState>();
  final validador = Validar();

  final void Function(Reserva reserva)? onPressedCriarAtualizar;

  TextEditingController localController = TextEditingController();
  TextEditingController dataDoAgendamentoController = TextEditingController();

  TextEditingController incioDoAgendamentoController = TextEditingController();
  TextEditingController finalDoAgendamentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    localController.text = local;

    ///
    dataDoAgendamentoController.text = '2024-12-12';
    incioDoAgendamentoController.text = '16:00';
    finalDoAgendamentoController.text = '20:00';

    ///

    return AlertDialog(
      title: TextoPersonalizado(titulo),
      backgroundColor: Cores.corDoAlertDialog(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40.0),
      content: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    campoDeTextoCadastro(
                        somenteVisualizacao: true,
                        controller: localController,
                        validacao: (text) => text.isEmpty,
                        campo: 'Local de Agendamento',
                        textoErro: 'Local Invalido'),
                    CampoData(
                        controllerData: dataDoAgendamentoController,
                        titulo: 'Dia do Agendamento'),
                    campoDeTextoCadastro(
                        teclado: TextInputType.datetime,
                        controller: incioDoAgendamentoController,
                        validacao: (text) => text.isEmpty,
                        campo: 'Incio do Agendamento',
                        textoErro: 'Horaio Invalido'),
                    campoDeTextoCadastro(
                        teclado: TextInputType.datetime,
                        controller: finalDoAgendamentoController,
                        validacao: (text) => text.isEmpty,
                        campo: 'final do Agendamento',
                        textoErro: 'Horario Invalido'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const TextoPersonalizado('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    dataDoAgendamentoController.text.isNotEmpty) {
                  Reserva r = Reserva(
                      cpf: '1234',
                      areaId: id,
                      startOfScheduling: DateFormatBR.dataParaEnviar(
                          dataDoAgendamentoController.text,
                          incioDoAgendamentoController.text),
                      endOfScheduling: DateFormatBR.dataParaEnviar(
                          dataDoAgendamentoController.text,
                          finalDoAgendamentoController.text));

                  print(jsonEncode(r.toJson()));

                  Navigator.of(context).pop();
                }
              },
              child: TextoPersonalizado(botaoDeEnviar),
            ),
          ],
        )
      ],
    );
  }
}
