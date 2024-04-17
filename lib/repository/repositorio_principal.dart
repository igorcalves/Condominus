import 'dart:async';
import 'dart:convert';

import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/repository/interfaceContrato.dart';
import 'package:http/http.dart' as http;

class RepositorioPrincipal extends ImplementarRepositorio {
  final String _uri;

  RepositorioPrincipal(this._uri);

  @override
  Future<Map<String, dynamic>> bucarPorCpf(String cpf) async {
    var response;
    try {
      var url = Uri.parse('$_uri/users/cpf?cpf=$cpf');
      response = await http.get(url).timeout(Duration(seconds: 2));
    } catch (e) {
      throw Exception('Servidor Offline');
    }

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 404) {
      var errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      throw Exception(errorMessage);
    } else {
      var errorMessage = 'Erro desconhecido';
      try {
        errorMessage = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      } catch (_) {
        throw Exception('Servidor Offline');
      }
      throw Exception(errorMessage);
    }
  }

  @override
  void criarUsuario(user) {
    // TODO: implement criarUsuario
  }

  @override
  void deletarUsuario(String cpf) {
    // TODO: implement deletarUsuario
  }

  @override
  Future<List> buscarPorNome(String nome) async {
    try {
      var url = Uri.parse('$_uri/users/name?name=$nome');
      var response = await http.get(url).timeout(Duration(seconds: 2));
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        var errorMessage = '';
        try {
          errorMessage = jsonDecode(utf8.decode(response.bodyBytes))["message"];
        } catch (e) {
          errorMessage = '${response.reasonPhrase}';
        }
        throw Exception(errorMessage);
      }
    } on TimeoutException catch (_) {
      throw Exception('Tempo limite de conexão excedido');
    } on http.ClientException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
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

    var loadedUsers = jsonDecode(utf8.decode(response.bodyBytes));
    return loadedUsers;
  }
}
