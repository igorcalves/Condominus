import 'package:Condominus/dominio/formatadores.dart';

class Reserva {
  int? id;
  String? name;
  String? cpf;
  String? nameArea;
  String? startOfScheduling;
  String? endOfScheduling;
  String? areaId;

  Reserva(
      {this.id,
      this.name,
      this.cpf,
      this.nameArea,
      this.areaId,
      this.startOfScheduling,
      this.endOfScheduling});
  Reserva.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cpf = json['cpf'];
    nameArea = json['nameArea'];
    startOfScheduling = json['startOfScheduling'];
    endOfScheduling = json['endOfScheduling'];
  }
  @override
  String toString() {
    return '\nid: $id\nname: $name \ncpf: $cpf \nnameArea: $nameArea \nstartOfScheduling: $startOfScheduling  \nendOfScheduling: $endOfScheduling\n';
  }

  String agendamento() {
    return '${DateFormatBR.extrairHoras(startOfScheduling!)} as ${DateFormatBR.extrairHoras(endOfScheduling!)} do dia ${DateFormatBR.dateFormat(DateFormatBR.extrairData(startOfScheduling!))} ';
  }

  static List<Reserva> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Reserva.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'cpf': cpf,
      'areaId': areaId,
      'startOfScheduling': startOfScheduling,
      'endOfScheduling': endOfScheduling
    };
  }
}
