import 'package:Condominus/dominio/formatadores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/pages/sindico/usuarios/sub_tela_editar_criar_usuario.dart';
import 'package:provider/provider.dart';

TextStyle estiloDoTexto() {
  return TextStyle(color: Cores.corDoTextoPrincipal());
}

TextStyle estiloDoTextoDeErro() {
  return const TextStyle(color: Colors.redAccent, fontSize: 14);
}

TextFormField campoDeTextoCadastro(
    {required TextEditingController controller,
    required bool Function(String text) validacao,
    required String campo,
    required String textoErro}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: campo,
      labelStyle: estiloDoTexto(),
      hintStyle: estiloDoTexto(),
      errorStyle: estiloDoTextoDeErro(),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    validator: (value) {
      if (validacao(value!)) {
        return textoErro;
      }
      return null;
    },
  );
}

class CampoData extends StatelessWidget {
  final TextEditingController controllerData;
  const CampoData({required this.controllerData, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerData,
      decoration: InputDecoration(
        labelText: 'Date',
        prefixIcon: const Icon(Icons.calendar_today),
        labelStyle: estiloDoTexto(),
        hintStyle: estiloDoTexto(),
        errorStyle: estiloDoTextoDeErro(),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      readOnly: true,
      onTap: () => {_selectDate(context)},
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? data = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        builder: (context, child) => Theme(
            data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  surface: Colors.blue,
                ),
                dialogBackgroundColor: Colors.white),
            child: child!),
        lastDate: DateTime(2100));
    if (data != null) {
      controllerData.text =
          DateFormatBR.dateFormat(data.toString().split(' ')[0]);
    }
  }
}
