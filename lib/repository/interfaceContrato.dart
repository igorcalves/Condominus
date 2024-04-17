abstract class ImplementarRepositorio {
  void criarUsuario(dynamic user);
  Future<Map<String, dynamic>> bucarPorCpf(String cpf);
  Future<List<dynamic>> buscarPorNome(String nome);

  Future<List<dynamic>> buscarTodos();
  void deletarUsuario(String cpf);
}
