import 'package:Condominus/dominio/formatadores.dart';
import 'package:Condominus/dominio/validadores.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:Condominus/dominio/entidades/user.dart';
import 'package:Condominus/modelosDoApp/modelos_textField.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:provider/provider.dart';

AlertDialog telaParaAdicionarPessoas(BuildContext context, String titulo,
    {User? user}) {
  final _formKey = GlobalKey<FormState>();
  final validador = Validar();

  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataDeNascimentoController = TextEditingController();
  TextEditingController condominiumPriceController = TextEditingController();
  TextEditingController numeroDoApartamentoController = TextEditingController();

  if (user != null) {
    nomeController.text = user.name!;
    cpfController.text = user.cpf!;
    telefoneController.text = user.phone!;
    roleController.text = user.role!;
    emailController.text = user.email!;
    dataDeNascimentoController.text = DateFormatBR.dateFormat(user.birthDay!);
    condominiumPriceController.text = user.condominiumPrice.toString();
    numeroDoApartamentoController.text = user.apartmentNumber!;
  }
  UserProvider userProvider = Provider.of(context);

  return AlertDialog(
    title: TextoPersonalizado(titulo),
    backgroundColor: Cores.corDoAlertDialog(),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    contentPadding: EdgeInsets.zero,
    insetPadding: const EdgeInsets.symmetric(horizontal: 40.0),
    content: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  campoDeTextoCadastro(
                      campo: 'Nome',
                      controller: nomeController,
                      validacao: (text) => validador.nomeValido(text),
                      textoErro: 'nome invalido'),
                  campoDeTextoCadastro(
                      campo: 'Cpf',
                      controller: cpfController,
                      validacao: (text) => validador.cpfValido(text),
                      textoErro: 'cpf invalido'),
                  campoDeTextoCadastro(
                      campo: 'Telefone',
                      controller: telefoneController,
                      validacao: (text) => validador.telefoneValido(text),
                      textoErro: 'telefone invalido'),
                  campoDeTextoCadastro(
                      campo: 'Tipo de Usuario',
                      controller: roleController,
                      validacao: (text) => validador.roleValida(text),
                      textoErro: 'Somente User ou Adm'),
                  campoDeTextoCadastro(
                      campo: 'Email',
                      controller: emailController,
                      validacao: (text) => validador.emailValido(text),
                      textoErro: 'email invalido'),
                  CampoData(
                    controllerData: dataDeNascimentoController,
                  ),
                  campoDeTextoCadastro(
                      campo: 'Preço do Condomínio',
                      controller: condominiumPriceController,
                      validacao: (text) =>
                          validador.precoDoCondominioValido(text),
                      textoErro: 'Preço do condomínio invalido'),
                  campoDeTextoCadastro(
                      campo: 'Número do Apartamento',
                      controller: numeroDoApartamentoController,
                      validacao: (text) =>
                          validador.numeroDoApartamentoValido(text),
                      textoErro: 'Número do apartamento invalido'),
                ],
              ),
            );
          },
        ),
      ),
    ),
    actions: [
      Row(
        children: [
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const TextoPersonalizado('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                userProvider.criarUsuario(User(
                    name: nomeController.text,
                    cpf: cpfController.text,
                    apartmentNumber: numeroDoApartamentoController.text,
                    birthDay: DateFormatBR.dateFormatDefault(
                        dataDeNascimentoController.text),
                    condominiumPrice:
                        double.tryParse(condominiumPriceController.text),
                    email: emailController.text,
                    phone: telefoneController.text,
                    role: roleController.text));
                Navigator.of(context).pop();
              }
            },
            child: const TextoPersonalizado('Registrar'),
          ),
        ],
      )
    ],
  );
}
