

import 'package:flutter/material.dart';
import 'package:telas/buscarMorador/User.dart';
import 'package:telas/componentes/campo_texto.dart';
import 'package:telas/modelosDoApp/modelo_cores.dart';
import 'package:telas/modelosDoApp/modelo_texto.dart';

AlertDialog telaParaAdicionarPessoas(BuildContext context,String  titulo,{User? user}){

  

  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataDeNascimentoController = TextEditingController();
  TextEditingController condominiumPriceController = TextEditingController();
  TextEditingController numeroDoApartamentoController = TextEditingController();

  if(user != null){
    nomeController.text = user.name;
  cpfController.text = user.cpf;
  telefoneController.text = user.idade.toString();
  /*
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataDeNascimentoController = TextEditingController();
  TextEditingController condominiumPriceController = TextEditingController();
  TextEditingController numeroDoApartamentoController = TextEditingController();
*/
  }
  
  



  return AlertDialog(
  title:  TextoPersonalizado(titulo),
  backgroundColor:Cores.corDoAlertDialog(),
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
              campoDeTextoCadastro('Data de Nascimento', dataDeNascimentoController),
              campoDeTextoCadastro('Preço do Condomínio', condominiumPriceController),
              campoDeTextoCadastro('Número do Apartamento', numeroDoApartamentoController),
              
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
            print(nomeController.text);
          },
          child: const TextoPersonalizado('Registrar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const TextoPersonalizado('Cancelar'),
        ),
      ],
    )
  ],
);

}
