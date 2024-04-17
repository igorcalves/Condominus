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

  Future<List<dynamic>> buscarTodos() {
    return Future.delayed(const Duration(seconds: 1), () => userList);
  }

/*
  @override
  deletarUsuario(String cpf) {
    userList.removeWhere((user) => user['cpf'] == cpf);
  }
*/
  @override
  criarUsuario(dynamic user) {
    user = user as User;
    deletarUsuario(user.cpf!);
    var userMap = user.toJson();
    userList.add(userMap);
  }

  @override
  buscarMoradorPorCpf(String cpf) {
    return Future.delayed(
        const Duration(seconds: 1),
        () => userList.firstWhere((user) => user['cpf'] == cpf,
            orElse: () => throw Exception('Usuario Não Encontrado')));
  }

  @override
  Future<List> buscarMoradorPorNome(String nome) {
    // TODO: implement buscarPorNome
    throw UnimplementedError();
  }

  @override
  Future<List> carregarTodosUsuarios() async {
    return userList;
  }

  @override
  Future deletarUsuario(String cpf) {
    // TODO: implement deletarUsuario
    throw UnimplementedError();
  }
}
