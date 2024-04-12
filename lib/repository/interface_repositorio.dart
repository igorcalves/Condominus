abstract class ImplementarRepositorio {
  void criarUsuario(dynamic user);
  dynamic bucarPorCpf(String cpf);
  List<dynamic> buscarPorNome(String nome);
  List<dynamic> buscarTodos();
  void deletarUsuario(String cpf);
}
