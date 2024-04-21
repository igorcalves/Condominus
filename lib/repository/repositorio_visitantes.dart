import 'dart:convert';

import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/repository/interface_repositorio_visitantes.dart';
import 'package:http/http.dart' as http;

class RepositorioVisitantes extends InterfaceRepositorioVisiante {
  final String _uri;

  RepositorioVisitantes(this._uri);

  @override
  Future buscarVisitantePorCpf(String cpf) {
    // TODO: implement buscarVisitantePorCpf
    throw UnimplementedError();
  }

  @override
  Future<List> buscarVisitantePorCpfDoMorador(String cpfDoMorador) {
    // TODO: implement buscarVisitantePorCpfDoMorador
    throw UnimplementedError();
  }

  @override
  Future<List> buscarVisitantePorNome(String nome) async {
    var response =
        await http.get(Uri.parse('$_uri/users/visitors/name?name=$nome'));
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    return Visitantes.fromJsonList(json);
  }
}
