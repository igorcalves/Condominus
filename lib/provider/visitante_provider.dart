import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/repository/interface_repositorio_visitantes.dart';
import 'package:flutter/material.dart';

class VisitantesProvider with ChangeNotifier {
  late List<Visitantes> visitantes = [];

  InterfaceRepositorioVisiante repositorioVisiante;

  VisitantesProvider(this.repositorioVisiante);

  buscarTodos() {
    return [...visitantes];
  }

  carregarTodos() async {
    visitantes = await repositorioVisiante.buscarVisitantePorNome('')
        as List<Visitantes>;
    notifyListeners();
  }
}
