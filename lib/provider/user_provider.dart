import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/repository/interface_repositorio.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late List<User> users = [];

  UserProvider(this._repositorio);

  final ImplementarRepositorio _repositorio;

  List<User> buscarTodos() {
    return [...users];
  }

  int tamanhoDaLista() {
    return users.length;
  }

  void buscarNomeOuCpf(String data) {
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
      users = _repositorio.buscarTodos() as List<User>;
    }

    notifyListeners();
  }

  void _buscarUsuariosPorCpf(String cpf) {
    if (_repositorio.bucarPorCpf(cpf) != null) {
      users.add(_repositorio.bucarPorCpf(cpf)!);
    } else {
      users = [];
    }
  }

  void _buscarUsuariosPorNome(String nome) {
    var userD = _repositorio.buscarPorNome(nome);
    users = User.fromJsonList(userD);
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
