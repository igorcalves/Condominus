

import 'package:flutter/material.dart';
import 'package:Condominus/buscarMorador/User.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';

AlertDialog telaDeDadosUsuario(User user){
  return AlertDialog(
    title: TextoPersonalizado(user.cpf,tamanho: 14,opacidade: 0.69,),
    backgroundColor: Cores.corDoAlertDialog(opacidade: 1),
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
    contentPadding: EdgeInsets.zero,
    content: Padding(
      padding: const EdgeInsets.all(20.0),
      child:
          TextoPersonalizado(user.toString(),tamanho: 15,),
          
      
      ),
  );
}