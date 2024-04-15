import 'dart:async';
import 'dart:convert';

import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/repository/interfaceContrato.dart';
import 'package:http/http.dart' as http;

class RepositorioPrincipal extends ImplementarRepositorio {
  final String _uri;

  RepositorioPrincipal(this._uri);

  @override
  bucarPorCpf(String cpf) async {
    try {
      var url = Uri.parse('$_uri/users/cpf?cpf=$cpf');
      var response = await http.get(url).timeout(Duration(seconds: 2));

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        var errorMessage = 'Erro desconhecido';
        try {
          errorMessage = jsonDecode(utf8.decode(response.bodyBytes))["message"];
        } catch (e) {
          errorMessage = 'Erro: ${response.reasonPhrase}';
        }
        return {'error': 'Erro: $errorMessage'};
      }
    } on TimeoutException catch (_) {
      return {'error': 'Tempo limite de conexão excedido'};
    } on http.ClientException catch (e) {
      return {'error': 'Erro: $e'};
    } catch (e) {
      return {'error': 'Erro inesperado: $e'};
    }
  }

  @override
  List buscarTodos() {
    // TODO: implement buscarTodos
    throw UnimplementedError();
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
  Future<List> carregarTodosUsuarios() async {
    var url = Uri.parse('$_uri/users');

    var response = await http.get(url).timeout(Duration(seconds: 2));

    List<dynamic> loadedUsers = jsonDecode(utf8.decode(response.bodyBytes));
    return loadedUsers;
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
}
