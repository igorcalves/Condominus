import 'package:intl/intl.dart';

class DateFormatBR {
  static String dateFormat(String dataString) {
    DateTime data = DateTime.parse(dataString);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }
}
