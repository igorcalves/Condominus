import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/repository/interfaceContrato.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late List<User> users = [];

  UserProvider(this._repositorio);

  final ImplementarRepositorio _repositorio;

  List<User>? buscarTodos() {
    return [...users].isNotEmpty ? [...users] : null;
  }

  void carregarTodos() async {
    var usurariosCarreagos = await _repositorio.carregarTodosUsuarios();
    users = User.fromJsonList(usurariosCarreagos);
    notifyListeners();
  }

  int tamanhoDaLista() {
    return users.length;
  }

  void escolherTipoDeBusca(String data) {
    users = [];

    bool apenasNumeros = true;
    for (int i = 0; i < data.length; i++) {
      if (!RegExp(r'^[0-9]+$').hasMatch(data[i])) {
        apenasNumeros = false;
        break;
      }
    }
    if (data.isNotEmpty) {
      if (apenasNumeros) {
        _buscarUsuariosPorCpf(data);
      } else {
        _buscarUsuariosPorNome(data);
      }
    } else {
      carregarTodos();
    }
  }

  void _buscarUsuariosPorCpf(String cpf) async {
    var user = await _repositorio.bucarPorCpf(cpf);
    if (user is User) {
      users.add(User.fromJson(user));
    } else {
      users = [];
    }
    notifyListeners();
  }

  void _buscarUsuariosPorNome(String nome) async {
    var userD = await _repositorio.buscarPorNome(nome);
    users = User.fromJsonList(userD);
    notifyListeners();
  }

  void deletarUsuario(String cpf) {
    _repositorio.deletarUsuario(cpf);
    users = _repositorio.buscarTodos() as List<User>;
    notifyListeners();
  }

  void criarUsuario(User user) {
    _repositorio.criarUsuario(user);
    users = _repositorio.buscarTodos() as List<User>;

    notifyListeners();
  }
}
