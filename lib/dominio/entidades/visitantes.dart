import 'user.dart';

class Visitantes {
  String? name;
  String? cpf;
  String? birthDay;
  String? email;
  String? registrationDate;
  String? phone;
  User? user;
  String? cpfUser;

  Visitantes(
      {this.name,
      this.cpf,
      this.birthDay,
      this.email,
      this.registrationDate,
      this.phone,
      this.cpfUser,
      this.user});

  Visitantes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    birthDay = json['birthDay'];
    email = json['email'];
    registrationDate = json['registrationDate'];
    phone = json['phone'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJsonCreate() {
    return {
      'name': name,
      'cpf': cpf,
      'birthDay': birthDay,
      'email': email,
      'registrationDate': registrationDate,
      'phone': phone,
      'cpfUser': cpfUser
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      'name': name,
      'cpf': cpf,
      'birthDay': birthDay,
      'email': email,
      'registrationDate': registrationDate,
      'phone': phone,
      'cpfUser': cpfUser,
      'user': user
    };
  }

  static List<Visitantes> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Visitantes.fromJson(json)).toList();
  }

  @override
  String toString() {
    return 'name: $name\ncpf: $cpf\nbirthDay: $birthDay\nemail: $email\ndata de registro: $registrationDate\nphone: $phone\ncpf Do Morador: ${user!.cpf}';
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
