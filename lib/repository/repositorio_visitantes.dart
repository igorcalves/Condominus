import 'dart:convert';

import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/repository/interface_repositorio_visitantes.dart';
import 'package:http/http.dart' as http;

class RepositorioVisitantes extends InterfaceRepositorioVisiante {
  final String _uri;

  RepositorioVisitantes(this._uri);

  buscadorGenerico(String path, String recursoDeBusca) async {
    http.Response response;
    try {
      var url = Uri.parse(_uri + path + recursoDeBusca);
      response = await http.get(url).timeout(const Duration(seconds: 2));
    } catch (e) {
      throw Exception('Servidor Offiline');
    }

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }

  @override
  Future<List> buscarVisitantePorCpfDoMorador(String cpfDoMorador) async {
    return await buscadorGenerico('/users/visitors/cpfuser?cpf=', cpfDoMorador);
  }

  @override
  Future<List<dynamic>> buscarVisitantePorNome(String nome) async {
    return await buscadorGenerico('/users/visitors/name?name=', nome);
  }
}
