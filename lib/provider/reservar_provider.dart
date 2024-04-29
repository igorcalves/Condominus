import 'package:Condominus/dominio/entidades/reserva.dart';
import 'package:Condominus/repository/interface_repositorio_reservas.dart';
import 'package:flutter/material.dart';

class ReservaProvider with ChangeNotifier {
  late List<Reserva> reservas = [];

  ReservaProvider(this.repositotio);

  InterfaceRepositorioReserva repositotio;
  bool _deuError = false;
  bool _carregamento = false;
  String _msgError = '';

  buscarTodos() {
    return [...reservas];
  }

  tamanhoDaLista() {
    return reservas.length;
  }

  carregarTodos(String cpf) async {
    await repositotio.buscarTodasReservas(cpf).then((value) {
      reservas = Reserva.fromJsonList(value);
      notifyListeners();
      _deuError = false;
    }).catchError((error) => _chamarErro(error));
  }

  criarReserva(Reserva reserva, String cpf) async {
    await repositotio.criarReserva(reserva).then((value) async {
      carregarTodos(cpf);
      _deuError = false;
    }).catchError((error) => _chamarErro(error));
  }

  _chamarErro(error) {
    _msgError = error.message;
    _deuError = true;
  }
}
