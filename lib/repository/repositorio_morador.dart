import 'dart:async';
import 'dart:convert';

import 'package:Condominus/repository/interface_repositorio_moradores.dart';
import 'package:http/http.dart' as http;

class RepositorioPrincipal extends InterfaceRepositorioMorador {
  final String _uri;

  RepositorioPrincipal(this._uri);

  buscarMoradorGenerico(String path, String recursoDeBusca) async {
    http.Response response;
    try {
      var url = Uri.parse(_uri + path + recursoDeBusca);
      response = await http.get(url).timeout(const Duration(seconds: 2));
    } catch (e) {
      throw Exception('Servidor Offline');
    }

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }

  @override
  Future<Map<String, dynamic>> buscarMoradorPorCpf(String cpf) async {
    return await buscarMoradorGenerico('/users/cpf?cpf=', cpf);
  }

  @override
  Future<List<dynamic>> buscarMoradorPorNome(String nome) async {
    return await buscarMoradorGenerico('/users/name?name=', nome);
  }

  @override
  criarUsuario(user) async {
    http.Response response;
    try {
      var url = Uri.parse('$_uri/users');
      response = await http.post(url, body: jsonEncode(user), headers: {
        "Content-Type": "application/json",
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
  Future<List> buscarTodos() async {
    var url = Uri.parse('$_uri/users');
    var response;

    try {
      response = await http.get(url).timeout(Duration(seconds: 2));
    } catch (_ClientSocketException) {
      throw Exception('Servidor Offline');
    }

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }

  Future _ativarOuDesativarUsuario(
      String cpf, String habilitarOuDesabilitar) async {
    http.Response response;

    try {
      var url = Uri.parse('$_uri/users/$habilitarOuDesabilitar?cpf=$cpf');
      response = await http.put(url).timeout(const Duration(seconds: 2));
    } catch (e) {
      throw Exception('Servidor Offline');
    }

    if (response.statusCode == 200) {
      return response.body;
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }

  @override
  Future desativarUsuario(String cpf) async {
    return await _ativarOuDesativarUsuario(cpf, 'disable');
  }

  @override
  Future ativarUsuario(String cpf) async {
    return await _ativarOuDesativarUsuario(cpf, 'enable');
  }
}