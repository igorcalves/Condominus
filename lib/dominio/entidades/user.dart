import 'package:intl/intl.dart';

class User {
  String? name;
  String? login;
  String? cpf;
  String? phone;
  String? role;
  String? email;
  String? senha;
  String? birthDay;
  double? condominiumPrice;
  String? apartmentNumber;
  String? token;
  bool? enable;

  User({
    this.name,
    this.login,
    this.cpf,
    this.phone,
    this.role,
    this.email,
    this.senha,
    this.birthDay,
    this.condominiumPrice,
    this.apartmentNumber,
    this.enable = true,
    this.token,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['login'] = login;
    data['cpf'] = cpf;
    data['phone'] = phone;
    data['role'] = role;
    data['email'] = email;
    data['password'] = senha;
    data['birthDay'] = birthDay;
    data['condominiumPrice'] = condominiumPrice;
    data['apartmentNumber'] = apartmentNumber;
    data['enabled'] = true;
    return data;
  }

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    login = json['login'];
    cpf = json['cpf'];
    phone = json['phone'];
    role = json['role'];
    email = json['email'];
    senha = json['password'];
    birthDay = json['birthDay'];
    condominiumPrice = json['condominiumPrice'];
    apartmentNumber = json['apartmentNumber'];
    token = json['token'];
    enable = json['enabled'];
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }

  @override
  String toString() {
    return 'Login: $login\nCPF: $cpf\nPhone: $phone\nTipo de usuario : ${role == 'ADM' ? 'Sindíco' : 'Morador'}\nEmail: $email '
        '\nData de Nascimento: ${dateFormat(birthDay!)}\nPreço do condominio: $condominiumPrice\n'
        'numero do apartamento: $apartmentNumber\nstatus: ${enable! ? 'Ativado' : 'Desativado'}';
  }

  String dateFormat(String dataString) {
    DateTime data = DateTime.parse(dataString);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(data);
  }

  String pegarNomeESobrenome() {
    if (name != null) {
      List<String> parts = name!.split(' ');
      if (parts.isNotEmpty) {
        return '${parts[0]} ${parts[1]}';
      }
    }
    return '';
  }
}
