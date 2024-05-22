import 'package:Condominus/dominio/entidades/auth.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/repository/interfaces/interface_repositorio_moradores.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late List<User> users = [];
  late User user;

  bool _carregamento = false;
  bool _deuError = false;
  String _msgError = '';

  UserProvider(this._repositorio);

  final InterfaceRepositorioMorador _repositorio;

  List<User>? buscarTodos() {
    return [...users].isNotEmpty ? [...users] : null;
  }

  User getUser() {
    return user;
  }

  login(AuthDto authDto) async {
    trocarEstadoCarregamento();
    await _repositorio.login(authDto).then((value) {
      _deuError = false;
      trocarEstadoCarregamento();
      user = User.fromJson(value);
    }).catchError((error) {
      _msgError = error.message;
      _deuError = true;
      trocarEstadoCarregamento();
    });
  }

  carregarTodos(token) async {
    await _repositorio.buscarTodos(token).then((value) {
      users = User.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) {
      _msgError = error.message;
      _deuError = true;
      trocarEstadoCarregamento();
    });
  }

  int tamanhoDaLista() {
    return users.length;
  }

  escolherTipoDeBusca(String data, token) async {
    trocarEstadoCarregamento();
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
        await _buscarUsuariosPorCpf(data, token);
      } else {
        await _buscarUsuariosPorNome(data, token);
      }
    } else {
      carregarTodos(token);
    }
  }

  _buscarUsuariosPorCpf(String cpf, token) async {
    await _repositorio.buscarMoradorPorCpf(cpf, token).then((value) {
      users.add(User.fromJson(value));
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  criarUsuario(User user, token) async {
    await _repositorio.criarUsuario(user, token).then((value) async {
      await carregarTodos(token);
    }).catchError((error) => _chamarErro(error));
  }

  atualizarUsuario(User user, token) async {
    await _repositorio.atualizarUsuario(user, token).then((value) async {
      await carregarTodos(token);
    }).catchError((error) => _chamarErro(error));
  }

  _buscarUsuariosPorNome(String nome, token) async {
    await _repositorio.buscarMoradorPorNome(nome, token).then((value) {
      users = User.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  void deletarUsuario(String cpf, token) async {
    trocarEstadoCarregamento();

    await _repositorio.desativarUsuario(cpf, token).then((value) async {
      await carregarTodos(token);
    }).catchError((error) => _chamarErro(error));
  }

  void ativarUsuario(String cpf, token) async {
    trocarEstadoCarregamento();

    await _repositorio.ativarUsuario(cpf, token).then((value) async {
      await carregarTodos(token);
    }).catchError((error) => _chamarErro(error));
  }

  get estaCarregando {
    return _carregamento;
  }

  get deuErro {
    return _deuError;
  }

  String get msgErro {
    return _msgError;
  }

  zerarLista() {
    users = [];
    trocarEstadoCarregamento();
  }

  trocarEstadoCarregamento() {
    if (_carregamento) {
      _carregamento = false;
    } else {
      _carregamento = true;
    }
    notifyListeners();
    return _carregamento;
  }

  _chamarErro(error) {
    _msgError = error.message;
    _deuError = true;
    trocarEstadoCarregamento();
  }
}
