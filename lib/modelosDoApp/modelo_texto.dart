

import 'package:flutter/material.dart';
import 'package:telas/componentes/icones_prontos.dart';
import 'package:telas/modelosDoApp/modelo_cores.dart';
import '/main.dart';

class TextoPersonalizado extends StatelessWidget {
    const TextoPersonalizado(this._texto, {this.tamanho = 18, Key? key}) : super(key: key);


  final String _texto;
  final double tamanho;

  @override
  Widget build(BuildContext context) {
    return Text(
      _texto,
      style: TextStyle(color: Cores.corDoTextoPrincipal(),fontSize: tamanho ),
    );
}

}


class TextoBuscarUsuario extends StatelessWidget {
  const TextoBuscarUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Cores.corDoTextoPrincipal(),
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconeDeAdicionar(onPressed: (){
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return telaParaAdicionarPessoas2(context);
                                }
                              );
                            }),
                            IconePequisa(onPressed: (){},)
                            
                          ],
                        ),
                        hintText: 'informe o nome ou cpf',
                        hintStyle: TextStyle(color: Cores.corDoTextoPrincipal())),
                  );
  }
}


AlertDialog telaParaAdicionarPessoas(){
  return AlertDialog(
    title: const TextoPersonalizado('Cadastro de Morador'),
    insetPadding: EdgeInsets.all(2),
    content: Column(children: [
      TextoPersonalizado('iiii'),
      TextoPersonalizado('iiii'),
      TextoPersonalizado('iiii'),


    ],),
    actions: [
      Row(children: [
        Spacer(),
        TextButton(onPressed: (){}, child: TextoPersonalizado('Registrar')),
        TextButton(onPressed: (){}, child: TextoPersonalizado('Cancelar'))

      ],)
    ],


  );
}



AlertDialog telaParaAdicionarPessoas2(BuildContext context){
  return AlertDialog(
    title: const TextoPersonalizado('Cadastro de Morador'),
  backgroundColor: const Color.fromARGB(121, 11, 67, 172).withOpacity(0.8),
  shape: const RoundedRectangleBorder(
    borderRadius:
      BorderRadius.all(
        Radius.circular(30.0))),
    content: Builder(
      builder: (context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return SizedBox(
          height: height - 500,
          width: width - 400,
          child: const Column(children: [
            TextoPersonalizado('Agora foi'),
            TextoPersonalizado('Agora foi'),
            TextoPersonalizado('Agora foi'),
            TextoPersonalizado('Agora foi'),


          ],),
        );
      },
      
    ),
    actions: [
      Row(children: [
        Spacer(),
        TextButton(onPressed: (){}, child: TextoPersonalizado('Registrar')),
        TextButton(onPressed: (){
          Navigator.of(context).pop();

        }, child: TextoPersonalizado('Cancelar'))

      ],)
    ],
  );
}
