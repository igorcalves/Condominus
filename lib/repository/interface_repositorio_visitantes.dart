abstract class InterfaceRepositorioVisiante {
  Future<List<dynamic>> buscarVisitantePorNome(String nome);
  Future buscarVisitantePorCpf(String cpf);
  Future<List<dynamic>> buscarVisitantePorCpfDoMorador(String cpfDoMorador);
}
