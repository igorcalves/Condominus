import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:flutter/material.dart';

class CardDeNoticias extends StatelessWidget {
  final String _nomeDaImagem;
  final String _texto;
  final String _titulo;

  const CardDeNoticias({
    required String nomeDaImagem,
    required String texto,
    required String titulo,
    super.key,
  })  : _titulo = titulo,
        _texto = texto,
        _nomeDaImagem = nomeDaImagem;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310,
        color: Colors.white.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                height: 226,
                child: Image.asset('assets/imagens/$_nomeDaImagem')),
            TextoPersonalizado(_titulo),
            const SizedBox(height: 10.0),
            Text(
              _texto,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )
          ]),
        ));
  }
}
