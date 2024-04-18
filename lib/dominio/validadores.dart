import 'package:Condominus/dominio/interfaceValidadora.dart';

class Validar extends Validadores {
  bool _validarRegEx(text, regEx) {
    if (text.isEmpty) return true;
    RegExp regex = RegExp(regEx);

    return !regex.hasMatch(text);
  }

  @override
  bool nomeValido(String text) {
    if (text.length < 3) return true;
    return _validarRegEx(text, r'^[a-zA-Z]+\s+[a-zA-Z\s]*$');
  }

  @override
  bool cpfValido(String text) {
    if (text.length != 11) return true;
    return _validarRegEx(text, r'^\d+$');
  }

  @override
  bool emailValido(String text) {
    return _validarRegEx(text, r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  }

  @override
  bool numeroDoApartamentoValido(String text) {
    return _validarRegEx(text, r'^\d+[a-zA-Z]');
  }

  @override
  bool precoDoCondominioValido(String text) {
    if (_validarRegEx(text, r'^\d+(\.\d+)?$')) {
      return true;
    } else {
      double preco = double.parse(text);
      if (preco < 500) return true;
    }
    return false;
  }

  @override
  bool telefoneValido(String text) {
    if (text.length < 8 || text.length > 20) return true;
    return false;
  }

  @override
  bool roleValida(String text) {
    if (text.toLowerCase() == 'user' || text.toLowerCase() == 'adm') {
      return false;
    }
    return true;
  }
}
