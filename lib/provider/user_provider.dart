import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/repository/interfaceContrato.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late List<User> users = [];

  static bool estado = false;

  UserProvider(this._repositorio);

  final ImplementarRepositorio _repositorio;

  List<User>? buscarTodos() {
    return [...users].isNotEmpty ? [...users] : null;
  }

  void carregarTodos() async {
    var usurariosCarreagos = await _repositorio.carregarTodosUsuarios();
    await Future.delayed(const Duration(seconds: 1));

    users = User.fromJsonList(usurariosCarreagos);

    estado = false;
    notifyListeners();
  }

  int tamanhoDaLista() {
    return users.length;
  }

  void escolherTipoDeBusca(String data) async {
    users = [];

    estado = true;
    notifyListeners();

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
    await Future.delayed(const Duration(seconds: 1));
    if (user is User) {
      users.add(User.fromJson(user));
    } else {
      users = [];
    }

    estado = false;
    notifyListeners();
  }

  void _buscarUsuariosPorNome(String nome) async {
    var userD = await _repositorio.buscarPorNome(nome);
    await Future.delayed(const Duration(seconds: 1));

    users = User.fromJsonList(userD);
    notifyListeners();
    estado = false;
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
  }

  isLoading(bool estado) {
    notifyListeners();
  }
}
