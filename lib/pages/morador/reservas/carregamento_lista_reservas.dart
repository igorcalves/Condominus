import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/dominio/entidades/reserva.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/provider/reservar_provider.dart';
import 'package:flutter/material.dart';

class ListaDeReservas extends StatelessWidget {
  const ListaDeReservas({
    super.key,
    required this.reservaProvider,
  });

  final ReservaProvider reservaProvider;

  @override
  Widget build(BuildContext context) {
    if (reservaProvider.estaCarregando) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: reservaProvider.tamanhoDaLista(),
          itemBuilder: (context, index) {
            List<Reserva> reservas = reservaProvider.buscarTodos();
            Reserva reserva = reservas[index];
            return ListTile(
              leading: escolherItemDaReserva(reserva.id!),
              title: TextoPersonalizado(reserva.nameArea!),
              subtitle: TextoPersonalizado(
                reserva.agendamento(),
                tamanho: 17,
                opacidade: 0.4,
              ),
            );
          },
        ),
      );
    }
  }
}
