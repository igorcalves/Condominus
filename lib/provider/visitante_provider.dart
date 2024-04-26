import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/repository/interface_repositorio_visitantes.dart';
import 'package:flutter/material.dart';

class VisitantesProvider with ChangeNotifier {
  late List<Visitantes> visitantes = [];

  final InterfaceRepositorioVisiante _repositorioVisiante;

  VisitantesProvider(this._repositorioVisiante);
  bool _deuError = false;
  bool _carregamento = false;
  String _msgError = '';

  buscarTodos() {
    return [...visitantes];
  }

  escolherTipoDeBusca(String data) async {
    visitantes = [];

    bool apenasNumeros = true;
    for (int i = 0; i < data.length; i++) {
      if (!RegExp(r'^[0-9]+$').hasMatch(data[i])) {
        apenasNumeros = false;
        break;
      }
    }
    if (data.isNotEmpty) {
      if (apenasNumeros) {
        _buscarVisitantesProCpfDoMorador(data);
      } else {
        _buscarVisitantesPorNome(data);
      }
    } else {
      carregarTodos();
    }
  }

  criarVisitante(Visitantes visitante) async {
    trocarEstadoCarregamento();
    await _repositorioVisiante.criarVisitante(visitante).then((value) async {
      await carregarTodos();
    }).catchError((error) => _chamarErro(error));
  }

  _buscarVisitantesProCpfDoMorador(String cpfUser) async {
    await _repositorioVisiante
        .buscarVisitantePorCpfDoMorador(cpfUser)
        .then((value) {
      visitantes = Visitantes.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  _buscarVisitantesPorNome(String nome) async {
    await _repositorioVisiante.buscarVisitantePorNome(nome).then((value) {
      visitantes = Visitantes.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  carregarTodos() async {
    await _repositorioVisiante.buscarVisitantePorNome('').then((value) {
      visitantes = Visitantes.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  deletarVisitante(String cpf) async {
    await _repositorioVisiante
        .deletarVisitante(cpf)
        .then((value) async {})
        .catchError((error) => _chamarErro(error));
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

  _chamarErro(error) {
    _msgError = error.message;
    _deuError = true;
    trocarEstadoCarregamento();
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
}
