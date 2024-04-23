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

  carregarTodos() async {
    await _repositorioVisiante.buscarVisitantePorNome('').then((value) {
      visitantes = Visitantes.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) {
      _msgError = error.message;
      _deuError = true;
      trocarEstadoCarregamento();
    });
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
}
