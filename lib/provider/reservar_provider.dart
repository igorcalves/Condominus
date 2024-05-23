import 'package:Condominus/dominio/entidades/reserva.dart';
import 'package:Condominus/repository/interfaces/interface_repositorio_reservas.dart';
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

  carregarTodos(String cpf, token) async {
    await repositotio.buscarTodasReservas(cpf, token).then((value) {
      reservas = Reserva.fromJsonList(value);
      trocarEstadoCarregamento();
      _deuError = false;
    }).catchError((error) => _chamarErro(error));
  }

  criarReserva(Reserva reserva, String cpf, token) async {
    await repositotio.criarReserva(reserva, token).then((value) async {
      carregarTodos(cpf, token);
      _deuError = false;
    }).catchError((error) => _chamarErro(error));
  }

  _chamarErro(error) {
    trocarEstadoCarregamento();

    _msgError = error.message;
    _deuError = true;
    notifyListeners();
  }

  get estaCarregando {
    return _carregamento;
  }

  get deuErro {
    return _deuError;
  }

  String get msgErro {
    return _msgError;
  }

  trocarEstadoCarregamento() {
    if (_carregamento) {
      _carregamento = false;
    } else {
      _carregamento = true;
    }
    notifyListeners();
    return _carregamento;
  }

  trocarEstadoDoErro() {
    if (_deuError) {
      _deuError = false;
    } else {
      _deuError = true;
    }
    notifyListeners();
    return _deuError;
  }
}
