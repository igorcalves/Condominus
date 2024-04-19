abstract class ImplementarRepositorio {
  Future criarUsuario(dynamic user);
  Future<Map<String, dynamic>> buscarMoradorPorCpf(String cpf);
  Future<List<dynamic>> buscarMoradorPorNome(String nome);
  Future ativarUsuario(String cpf);
  Future<List<dynamic>> buscarTodos();
  Future desativarUsuario(String cpf);
}
