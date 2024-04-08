import 'package:flutter/material.dart';
import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sub_tela_criar_pessoa.dart';

TextField campoDeBusca(BuildContext context){

  final  TextEditingController textFieldController = TextEditingController();

  return TextField(
        controller: textFieldController,
        style: estiloDoTexto(),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.person,
            color: Cores.corDoTextoPrincipal(),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconeDeAdicionar(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return telaParaAdicionarPessoas(context,'Registro de Usuário');
                    },
                  );
                },
              ),
              IconePequisa(
                onPressed: () {
                  print(textFieldController.text);
                },
              )
            ],
          ),
          hintText: 'Informe o nome ou CPF',
          hintStyle: estiloDoTexto(),
        ),
      );
}


TextField campoDeTextoCadastro(String campo,TextEditingController controller,){

  return TextField(
    controller: controller,
      style: estiloDoTexto(),
      decoration: InputDecoration(
        labelText: campo,
        labelStyle: estiloDoTexto(),
        hintStyle: estiloDoTexto(),
        

      ),

  );
}

TextStyle estiloDoTexto(){
  return TextStyle(color: Cores.corDoTextoPrincipal());
}