

import 'package:flutter/material.dart';
import 'package:Condominus/componentes/campo_texto.dart';

import 'package:Condominus/modelosDoApp/modelo_cores.dart';


class TextoPersonalizado extends StatelessWidget {
    const TextoPersonalizado(this._texto, {this.opacidade = 1,this.tamanho = 18, super.key});

  final double opacidade;
  final String _texto;
  final double tamanho;

  @override
  Widget build(BuildContext context) {
    return Text(
      _texto,
      
      style: TextStyle(color: Cores.corDoTextoPrincipal().withOpacity(opacidade),fontSize: tamanho ),
    );
}

}


class TextoBuscarUsuario extends StatelessWidget {

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(20.0), 
        border: Border.all( 
          color: Cores.corDoTextoPrincipal(),
          width: 1.0, 
        ),
      ),
      child: campoDeBusca(context)
    );
  }
}



