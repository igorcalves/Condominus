import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/repository/interface_repositorio_moradores.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late List<User> users = [];

  bool _carregamento = false;
  bool _deuError = false;
  String _msgError = '';

  UserProvider(this._repositorio);

  final InterfaceRepositorioMorador _repositorio;

  List<User>? buscarTodos() {
    return [...users].isNotEmpty ? [...users] : null;
  }

  carregarTodos() async {
    await _repositorio.buscarTodos().then((value) {
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

  escolherTipoDeBusca(String data) async {
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
    await _repositorio.buscarMoradorPorCpf(cpf).then((value) {
      users.add(User.fromJson(value));
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  criarUsuario(User user) async {
    trocarEstadoCarregamento();

    await _repositorio.criarUsuario(user).then((value) {
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  void _buscarUsuariosPorNome(String nome) async {
    await _repositorio.buscarMoradorPorNome(nome).then((value) {
      users = User.fromJsonList(value);
      _deuError = false;
      trocarEstadoCarregamento();
    }).catchError((error) => _chamarErro(error));
  }

  void deletarUsuario(String cpf) async {
    trocarEstadoCarregamento();

    await _repositorio.desativarUsuario(cpf).then((value) async {
      await carregarTodos();
    }).catchError((error) => _chamarErro(error));
  }

  void ativarUsuario(String cpf) async {
    trocarEstadoCarregamento();

    await _repositorio.ativarUsuario(cpf).then((value) async {
      await carregarTodos();
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
