import 'dart:convert';

import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/repository/fakeDb.dart';
import 'package:Condominus/repository/interfaceContrato.dart';

class FakeRepository extends ImplementarRepositorio {
  List<dynamic> userList = jsonDecode(MyRepo.getData());

  // @override
  // User? bucarPorCpf(String cpf) {
  //   User usuarioFiltrado = userList
  //       .map((e) => User.fromJson(e))
  //       .firstWhere((user) => user.cpf == cpf, orElse: () => User());

  //   if (usuarioFiltrado.cpf != null) {
  //     return usuarioFiltrado;
  //   }
  //   return usuarioFiltrado;
  // }

  // @override
  // List<dynamic> buscarPorNome(String name) {
  //   List<dynamic> users = [];
  //   var usuariosFiltrados = userList
  //       .where(
  //           (user) => user['name'].toLowerCase().contains(name.toLowerCase()))
  //       .toList();

  //   if (usuariosFiltrados.isNotEmpty) {
  //     return usuariosFiltrados;
  //   }
  //   return users;
  // }

  @override
  List<User> buscarTodos() {
    return User.fromJsonList(userList);
  }

  @override
  void deletarUsuario(String cpf) {
    userList.removeWhere((user) => user['cpf'] == cpf);
  }

  @override
  void criarUsuario(dynamic user) {
    user = user as User;
    deletarUsuario(user.cpf!);
    var userMap = user.toJson();
    userList.add(userMap);
  }

  @override
  bucarPorCpf(String cpf) async {
    var usuarioFiltrado = await userList
        .firstWhere((user) => user['cpf'] == cpf, orElse: () => null);

    if (usuarioFiltrado['cpf'] != null) {
      return usuarioFiltrado;
    }
    return usuarioFiltrado;
  }

  @override
  Future<List> buscarPorNome(String nome) {
    // TODO: implement buscarPorNome
    throw UnimplementedError();
  }

  @override
  Future<List> carregarTodosUsuarios() async {
    return userList;
  }
}
