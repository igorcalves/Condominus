import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: Cores.gradientePrincipal(),
          child: Center(
            child: Image.asset('assets/imagens/logoBranco.png'),
          ),
        ),
      ),
    );
  }
}
