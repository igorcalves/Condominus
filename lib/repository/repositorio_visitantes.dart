import 'dart:convert';

import 'package:Condominus/repository/interfaces/interface_repositorio_visitantes.dart';
import 'package:http/http.dart' as http;

class RepositorioVisitantes extends InterfaceRepositorioVisiante {
  final String _uri;

  RepositorioVisitantes(this._uri);

  buscadorGenerico(String path, String recursoDeBusca, token) async {
    http.Response response;
    try {
      var url = Uri.parse(_uri + path + recursoDeBusca);
      response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      });
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
  Future<List> buscarVisitantePorCpfDoMorador(
      String cpfDoMorador, token) async {
    return await buscadorGenerico(
        '/users/visitors/cpfuser?cpf=', cpfDoMorador, token);
  }

  @override
  Future<List<dynamic>> buscarVisitantePorNome(String nome, token) async {
    return await buscadorGenerico('/users/visitors/name?name=', nome, token);
  }

  @override
  Future deletarVisitante(String cpf, token) async {
    http.Response response;
    try {
      var url = Uri.parse('$_uri/users/visitors?cpf=$cpf');
      response = await http.delete(url, headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      });
    } catch (e) {
      throw Exception('Servidor Offiline');
    }

    if (response.statusCode == 200) {
      throw Exception(response.body);
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }

  @override
  Future criarVisitante(visitante, token) async {
    http.Response response;
    try {
      var url = Uri.parse('$_uri/users/visitors');
      response = await http.post(url,
          body: jsonEncode(visitante.toJsonCreate()),
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $token'
          });
    } catch (e) {
      throw Exception('Servidor Offline');
    }

    if (response.statusCode == 200) {
      if (response.headers['content-type']?.contains('application/json') ??
          false) {
        return jsonDecode(utf8.decode(response.bodyBytes))['message'];
      } else {
        return utf8.decode(response.bodyBytes);
      }
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }

  @override
  Future editarVisitante(visitante, token) async {
    http.Response response;
    try {
      var url = Uri.parse('$_uri/users/visitors');
      response = await http.put(url,
          body: jsonEncode(visitante.toJsonUpdate()),
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $token'
          });
    } catch (e) {
      throw Exception('Servidor Offline');
    }

    if (response.statusCode == 200) {
      if (response.headers['content-type']?.contains('application/json') ??
          false) {
        return jsonDecode(utf8.decode(response.bodyBytes))['message'];
      } else {
        return utf8.decode(response.bodyBytes);
      }
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }
}
