

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
                              
                        
                            }),
                            IconePequisa(onPressed: (){},)
                            
                          ],
                        ),
                        hintText: 'informe o nome ou cpf',
                        hintStyle: TextStyle(color: Cores.corDoTextoPrincipal())),
                  );
  }
}