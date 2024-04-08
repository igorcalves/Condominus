// ignore: file_names
class User {
  String name;
  String cpf;
  int idade;

  User(this.name, this.cpf, this.idade);

  @override
  String toString() {
    return 'nome: $name \ncpf: $cpf \nidade: $idade';
  }
}