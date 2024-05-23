import 'package:Condominus/dominio/entidades/reserva.dart';
import 'package:Condominus/dominio/formatadores.dart';
import 'package:Condominus/dominio/validadores.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/modelosDoApp/modelos_text_field.dart';
import 'package:Condominus/pages/morador/reservas/mini_tela_aviso_de_erro.dart';
import 'package:Condominus/provider/reservar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SubTelaParaAdicionarReserva extends StatelessWidget {
  SubTelaParaAdicionarReserva(
      {super.key,
      required this.titulo,
      required this.onPressedCriarAtualizar,
      required this.botaoDeEnviar,
      required this.local,
      required this.id,
      required this.cpf});

  final String botaoDeEnviar;
  final String titulo;
  final String local;
  final String id;
  final String cpf;

  final _formKey = GlobalKey<FormState>();
  final validador = Validar();

  final Function(Reserva reserva)? onPressedCriarAtualizar;

  TextEditingController localController = TextEditingController();
  TextEditingController dataDoAgendamentoController = TextEditingController();

  TextEditingController incioDoAgendamentoController = TextEditingController();
  TextEditingController finalDoAgendamentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    localController.text = local;

    ReservaProvider reservaProvider = Provider.of<ReservaProvider>(
      context,
    );

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
                reservaProvider.trocarEstadoDoErro();

                Navigator.of(context).pop();
              },
              child: const TextoPersonalizado('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() &&
                    dataDoAgendamentoController.text.isNotEmpty) {
                  await onPressedCriarAtualizar!(Reserva(
                      cpf: cpf,
                      areaId: id,
                      startOfScheduling: DateFormatBR.dataParaEnviar(
                          dataDoAgendamentoController.text,
                          incioDoAgendamentoController.text),
                      endOfScheduling: DateFormatBR.dataParaEnviar(
                          dataDoAgendamentoController.text,
                          finalDoAgendamentoController.text)));
                  if (reservaProvider.deuErro) {
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return subDeTelaErro(
                              textoErro: reservaProvider.msgErro,
                              context: context);
                        },
                      );
                    }
                  } else {
                    reservaProvider.trocarEstadoDoErro();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
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
