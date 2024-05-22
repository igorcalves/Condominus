import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/dominio/formatadores.dart';
import 'package:Condominus/dominio/validadores.dart';
import 'package:flutter/material.dart';
import 'package:Condominus/modelosDoApp/modelos_text_field.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';

// ignore: must_be_immutable
class SubTelaParaAdicionarOuAtualizarVisitantes extends StatelessWidget {
  SubTelaParaAdicionarOuAtualizarVisitantes({
    super.key,
    required this.titulo,
    required this.onPressedCriarAtualizar,
    required this.botaoDeEnviar,
    this.visitante,
  });

  final String botaoDeEnviar;
  final String titulo;
  final Visitantes? visitante;

  final _formKey = GlobalKey<FormState>();
  final validador = Validar();

  final void Function(Visitantes visitantes) onPressedCriarAtualizar;

  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cpfDoMoradorController = TextEditingController();

  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataDeRegisto = TextEditingController();
  TextEditingController dataDeNascimentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (visitante != null) {
      nomeController.text = visitante!.name!;
      cpfController.text = visitante!.cpf!;
      telefoneController.text = visitante!.phone!;
      emailController.text = visitante!.email!;
      dataDeNascimentoController.text =
          DateFormatBR.dateFormat(visitante!.birthDay!);
      cpfDoMoradorController.text = visitante!.user!.cpf!;
    }

    return AlertDialog(
      title: TextoPersonalizado(titulo),
      backgroundColor: Cores.corDoAlertDialog(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40.0),
      content: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    campoDeTextoCadastro(
                        campo: 'Nome',
                        controller: nomeController,
                        validacao: (text) => validador.nomeValido(text),
                        textoErro: 'nome invalido'),
                    campoDeTextoCadastro(
                        campo: 'Cpf',
                        somenteVisualizacao: visitante != null ? true : false,
                        controller: cpfController,
                        validacao: (text) => validador.cpfValido(text),
                        textoErro: 'cpf invalido'),
                    CampoData(
                      titulo: 'Data de Nascimento',
                      controllerData: dataDeNascimentoController,
                    ),
                    campoDeTextoCadastro(
                        campo: 'Telefone',
                        controller: telefoneController,
                        validacao: (text) => validador.telefoneValido(text),
                        textoErro: 'telefone invalido'),
                    campoDeTextoCadastro(
                        campo: 'Email',
                        controller: emailController,
                        validacao: (text) => validador.emailValido(text),
                        textoErro: 'email invalido'),
                    campoDeTextoCadastro(
                        campo: 'Cpf Do Morador',
                        controller: cpfDoMoradorController,
                        validacao: (text) => validador.cpfValido(text),
                        textoErro: 'cpf invalido'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const TextoPersonalizado('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  onPressedCriarAtualizar(visitante != null
                      ? Visitantes(
                          name: nomeController.text,
                          cpf: cpfController.text,
                          birthDay: DateFormatBR.dateFormatDefault(
                              dataDeNascimentoController.text),
                          email: emailController.text,
                          phone: telefoneController.text,
                          cpfUser: cpfDoMoradorController.text,
                          registrationDate: visitante!.registrationDate,
                          user: visitante!.user)
                      : Visitantes(
                          name: nomeController.text,
                          cpf: cpfController.text,
                          birthDay: DateFormatBR.dateFormatDefault(
                              dataDeNascimentoController.text),
                          email: emailController.text,
                          phone: telefoneController.text,
                          cpfUser: cpfDoMoradorController.text,
                        ));
                  Navigator.of(context).pop();
                }
              },
              child: TextoPersonalizado(botaoDeEnviar),
            ),
          ],
        )
      ],
    );
  }
}
