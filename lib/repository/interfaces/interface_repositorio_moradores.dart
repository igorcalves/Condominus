abstract class InterfaceRepositorioMorador {
  Future criarUsuario(dynamic user, token);
  Future<Map<String, dynamic>> buscarMoradorPorCpf(String cpf, token);
  Future atualizarUsuario(dynamic user, token);
  Future<List<dynamic>> buscarMoradorPorNome(String nome, token);
  Future ativarUsuario(String cpf, token);
  Future<List<dynamic>> buscarTodos(token);
  Future desativarUsuario(String cpf, token);
  Future<dynamic> login(dynamic loginAndPassword);
}
