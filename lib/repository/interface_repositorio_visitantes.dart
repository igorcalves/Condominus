abstract class InterfaceRepositorioVisiante {
  Future<List<dynamic>> buscarVisitantePorNome(String nome);
  Future<List<dynamic>> buscarVisitantePorCpfDoMorador(String cpfDoMorador);
  Future deletarVisitante(String cpf);
  Future criarVisitante(dynamic visitante);
}
