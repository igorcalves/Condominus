import 'package:Condominus/dominio/formatadores.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:Condominus/dominio/user.dart';
import 'package:Condominus/componentes/campo_superior_busca.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:provider/provider.dart';

AlertDialog telaParaAdicionarPessoas(BuildContext context, String titulo,
    {User? user}) {
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
    content: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                campoDeTextoCadastro('Nome', nomeController),
                campoDeTextoCadastro('Cpf', cpfController),
                campoDeTextoCadastro('Telefone', telefoneController),
                campoDeTextoCadastro('Role', roleController),
                campoDeTextoCadastro('Email', emailController),
                campoDeTextoCadastro(
                    'Data de Nascimento', dataDeNascimentoController),
                campoDeTextoCadastro(
                    'Preço do Condomínio', condominiumPriceController),
                campoDeTextoCadastro(
                    'Número do Apartamento', numeroDoApartamentoController),
              ],
            ),
          );
        },
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
            },
            child: const TextoPersonalizado('Registrar'),
          ),
        ],
      )
    ],
  );
}
