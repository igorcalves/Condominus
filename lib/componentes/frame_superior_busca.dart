import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/modelosDoApp/modelos_text_field.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:flutter/material.dart';

class CampoDeBusca extends StatelessWidget {
  final VoidCallback? onPressedAdicionar;
  final void Function(String searchText)? onPressedPesquisa;

  CampoDeBusca(
      {super.key, this.onPressedAdicionar, required this.onPressedPesquisa});

  final TextEditingController textFieldController = TextEditingController();

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
      child: TextField(
        onSubmitted: (_) => onPressedPesquisa!(textFieldController.text),
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
              if (onPressedAdicionar != null)
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
