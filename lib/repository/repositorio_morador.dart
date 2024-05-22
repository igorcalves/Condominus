import 'dart:async';
import 'dart:convert';

import 'package:Condominus/repository/interfaces/interface_repositorio_moradores.dart';
import 'package:Condominus/service/tokenService.dart';
import 'package:http/http.dart' as http;

class RepositorioPrincipal extends InterfaceRepositorioMorador {
  final String _uri;

  RepositorioPrincipal(this._uri);

  buscarMoradorGenerico(
      String path, String recursoDeBusca, String token) async {
    http.Response response;
    try {
      var url = Uri.parse(_uri + path + recursoDeBusca);
      response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      });
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
  Future<Map<String, dynamic>> buscarMoradorPorCpf(String cpf, token) async {
    return await buscarMoradorGenerico('/users/cpf?cpf=', cpf, token);
  }

  @override
  Future<List<dynamic>> buscarMoradorPorNome(String nome, token) async {
    return await buscarMoradorGenerico('/users/name?name=', nome, token);
  }

  @override
  criarUsuario(user, token) async {
    http.Response response;
    try {
      var url = Uri.parse('$_uri/users');
      response = await http.post(url, body: jsonEncode(user), headers: {
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
  Future<List> buscarTodos(token) async {
    var url = Uri.parse('$_uri/users');
    http.Response response;

    try {
      response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      });
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

  Future _ativarOuDesativarUsuario(
      String cpf, String habilitarOuDesabilitar, token) async {
    http.Response response;

    try {
      var url = Uri.parse('$_uri/users/$habilitarOuDesabilitar?cpf=$cpf');
      response = await http.put(url, headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      });
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
  Future desativarUsuario(String cpf, token) async {
    return await _ativarOuDesativarUsuario(cpf, 'disable', token);
  }

  @override
  Future ativarUsuario(String cpf, token) async {
    return await _ativarOuDesativarUsuario(cpf, 'enable', token);
  }

  @override
  Future atualizarUsuario(user, token) async {
    http.Response response;
    try {
      var url = Uri.parse('$_uri/users/update');
      response = await http.put(url, body: jsonEncode(user), headers: {
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
  login(loginAndPassword) async {
    http.Response response;
    try {
      var url = Uri.parse('$_uri/auth/login');
      response =
          await http.post(url, body: jsonEncode(loginAndPassword), headers: {
        "Content-Type": "application/json",
      });
    } catch (e) {
      throw Exception('Servidor Offline');
    }
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData =
          jsonDecode(utf8.decode(response.bodyBytes));
      responseData["token"] = extrairTokenDoHeader(response.headers);
      return responseData;
    } else {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    }
  }
}
