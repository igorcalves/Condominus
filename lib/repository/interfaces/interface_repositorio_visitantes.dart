abstract class InterfaceRepositorioVisiante {
  Future<List<dynamic>> buscarVisitantePorNome(String nome, token);
  Future<List<dynamic>> buscarVisitantePorCpfDoMorador(
      String cpfDoMorador, token);
  Future editarVisitante(dynamic visitante, token);

  Future deletarVisitante(String cpf, token);
  Future criarVisitante(dynamic visitante, token);
}
