import 'package:Condominus/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:Condominus/componentes/icones_prontos.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/pages/sindico/usuarios/sub_tela_editar_criar_usuario.dart';
import 'package:provider/provider.dart';

class CampoDeBusca extends StatelessWidget {
  //final void Function(bool, Function, String) controlarEstado;
  CampoDeBusca({super.key});
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Builder(
                        builder: (BuildContext alertDialogContext) {
                          return telaParaAdicionarPessoas(
                              alertDialogContext, "Registro");
                        },
                      );
                    },
                  );
                },
              ),
              IconePequisa(
                onPressed: () {
                  users.escolherTipoDeBusca(textFieldController.text);
                  users.trocarEstadoCarregamento();
                },
              )
            ],
          ),
          hintText: 'Informe o nome ou CPF',
          hintStyle: estiloDoTexto(),
        ),
      ),
    );
  }
}

TextField campoDeTextoCadastro(
  String campo,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    style: estiloDoTexto(),
    decoration: InputDecoration(
      labelText: campo,
      labelStyle: estiloDoTexto(),
      hintStyle: estiloDoTexto(),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );
}

TextStyle estiloDoTexto() {
  return TextStyle(color: Cores.corDoTextoPrincipal());
}
