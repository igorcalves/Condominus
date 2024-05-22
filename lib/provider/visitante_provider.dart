import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/repository/interfaces/interface_repositorio_visitantes.dart';
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

  escolherTipoDeBusca(String data, token) async {
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
        _buscarVisitantesProCpfDoMorador(data, token);
      } else {
        _buscarVisitantesPorNome(data, token);
      }
    } else {
      carregarTodos(token);
    }
  }

  criarVisitante(Visitantes visitante, token) async {
    trocarEstadoCarregamento();
    await _repositorioVisiante
        .criarVisitante(visitante, token)
        .then((value) async {
      await carregarTodos(token);
    }).catchError((error) => _chamarErro(error));
  }

  editarVisitante(Visitantes visitante, token) async {
    trocarEstadoCarregamento();
    await _repositorioVisiante
        .editarVisitante(visitante, token)
        .then((value) async {
      await carregarTodos(token);
    }).catchError((error) => _chamarErro(error));
  }

  _buscarVisitantesProCpfDoMorador(String cpfUser, token) async {
    await _repositorioVisiante
        .buscarVisitantePorCpfDoMorador(cpfUser, token)
        .then((value) {
      visitantes = Visitantes.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  _buscarVisitantesPorNome(String nome, token) async {
    await _repositorioVisiante
        .buscarVisitantePorNome(nome, token)
        .then((value) {
      visitantes = Visitantes.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  carregarTodos(token) async {
    await _repositorioVisiante.buscarVisitantePorNome('', token).then((value) {
      visitantes = Visitantes.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  deletarVisitante(String cpf, token) async {
    await _repositorioVisiante
        .deletarVisitante(cpf, token)
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
