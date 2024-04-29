class Reserva {
  String? name;
  String? cpf;
  String? nameArea;
  String? startOfScheduling;
  String? endOfScheduling;
  String? areaId;

  Reserva(
      {this.name,
      this.cpf,
      this.nameArea,
      this.areaId,
      this.startOfScheduling,
      this.endOfScheduling});
  Reserva.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    nameArea = json['nameArea'];
    startOfScheduling = json['startOfScheduling'];
    endOfScheduling = json['endOfScheduling'];
  }
  @override
  String toString() {
    return 'name: $name \ncpf: $cpf \nnameArea: $nameArea \nstartOfScheduling: $startOfScheduling  \nendOfScheduling: $endOfScheduling\n';
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
