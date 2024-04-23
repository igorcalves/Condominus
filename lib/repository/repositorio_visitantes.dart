import 'dart:convert';

import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/repository/interface_repositorio_visitantes.dart';
import 'package:http/http.dart' as http;

class RepositorioVisitantes extends InterfaceRepositorioVisiante {
  final String _uri;

  RepositorioVisitantes(this._uri);

  buscadorGenerico(String path, String recursoDeBusca) async {
    http.Response response;
    String error = '';
    try {
      var url = Uri.parse(_uri + path + recursoDeBusca);
      response = await http.get(url).timeout(const Duration(seconds: 2));
      error = response.body;
    } catch (e) {
      throw Exception(error);
    }

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }

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
  Future<List<dynamic>> buscarVisitantePorNome(String nome) async {
    return buscadorGenerico('/name?name=', nome);
  }
}
