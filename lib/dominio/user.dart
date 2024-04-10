import 'package:Condominus/dominio/formatadores.dart';

class User {
  String? name;
  String? cpf;
  String? phone;
  String? role;
  String? email;
  String? birthDay;
  double? condominiumPrice;
  String? apartmentNumber;

  User(
      {this.name,
      this.cpf,
      this.phone,
      this.role,
      this.email,
      this.birthDay,
      this.condominiumPrice,
      this.apartmentNumber});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    phone = json['phone'];
    role = json['role'];
    email = json['email'];
    birthDay = json['birthDay'];
    condominiumPrice = json['condominiumPrice'];
    apartmentNumber = json['apartmentNumber'];
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }

  @override
  String toString() {
    return 'CPF: $cpf\nPhone: $phone\nTipo de usuario : $role\nEmail: $email '
        '\nData de Nascimento: ${DateFormatBR.dateFormat(birthDay!)}\nPreço do condominio: $condominiumPrice\n'
        'numero do apartamento: $apartmentNumber';
  }

  String getFirstNameAndLastName() {
    if (name != null) {
      List<String> parts = name!.split(' ');
      if (parts.isNotEmpty) {
        return '${parts[0]} ${parts[1]}';
      }
    }
    return '';
  }
}
