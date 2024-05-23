abstract class InterfaceRepositorioReserva {
  Future<List<dynamic>> buscarTodasReservas(String cpf, token);
  Future criarReserva(dynamic reserva, token);
}
