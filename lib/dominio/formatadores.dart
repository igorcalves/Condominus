import 'package:intl/intl.dart';

class DateFormatBR {
  static String dateFormat(String dataString) {
    DateTime data = DateTime.parse(dataString);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }

  static String dateFormatDefault(String dataString) {
    final DateFormat inputFormatter = DateFormat('dd/MM/yyyy');

    DateTime data = inputFormatter.parse(dataString);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(data);
  }

  static String dataParaEnviar(data, hora) {
    return '${data}T${hora}Z';
  }
}
