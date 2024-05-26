import 'dart:convert';

import 'package:Condominus/repository/interfaces/interface_repositorio_reservas.dart';
import 'package:http/http.dart' as http;

class RepositorioDeReservas extends InterfaceRepositorioReserva {
  RepositorioDeReservas(this._uri);
  final String _uri;

  @override
  Future<List> buscarTodasReservas(String cpf, token) async {
    http.Response response;
    try {
      var url = Uri.parse('$_uri/reservations/cpf?cpf=$cpf');
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
  Future criarReserva(reserva, token) async {
    var json = jsonEncode(reserva.toJson());
    http.Response response;
    try {
      var url = Uri.parse('$_uri/reservations');
      response = await http.post(url, body: json, headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer $token'
      });
    } catch (e) {
      throw Exception('Servidor Offline');
    }
    print(json);
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
