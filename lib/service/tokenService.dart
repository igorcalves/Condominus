String extrairTokenDoHeader(Map<String, String> headers) {
  String? authHeader = headers['authorization'];
  authHeader = authHeader!.replaceAll('"', '');
  if (authHeader != null && authHeader.startsWith('Bearer ')) {
    return authHeader.substring(7);
  } else {
    throw Exception('Token não encontrado no cabeçalho de autorização');
  }
}
