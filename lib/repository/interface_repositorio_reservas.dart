abstract class InterfaceRepositorioReserva {
  Future<List<dynamic>> buscarTodasReservas(String cpf);
  Future criarReserva(dynamic reserva);
}
