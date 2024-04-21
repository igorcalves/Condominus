import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/modelosDoApp/modelos_textField.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/pages/sindico/usuarios/sub_tela_editar_criar_usuario.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CampoDeBusca extends StatelessWidget {
  final VoidCallback? onPressedAdicionar;
  final void Function(String searchText)? onPressedPesquisa;

  CampoDeBusca(
      {required this.onPressedAdicionar, required this.onPressedPesquisa});

  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Cores.corDoTextoPrincipal(),
          width: 1.0,
        ),
      ),
      child: TextField(
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
                onPressed: onPressedAdicionar,
              ),
              IconePequisa(
                  onPressed: () =>
                      {onPressedPesquisa!(textFieldController.text)})
            ],
          ),
          hintText: 'Informe o nome ou CPF',
          hintStyle: estiloDoTexto(),
        ),
      ),
    );
  }
}
