import 'package:flutter/material.dart';
import '/modelosDoApp/modelo_cores.dart';


class IconeEditar extends StatelessWidget {
  final VoidCallback? onPressed; 

  const IconeEditar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      color: const Color(0xff89c5fd),
      onPressed: onPressed,
    );
  }
}
class IconeDeletar extends StatelessWidget {
  const IconeDeletar({super.key, this.onPressed});

  final VoidCallback? onPressed; 

  @override
  Widget build(BuildContext context) {
    return IconButton(
          icon: const Icon(Icons.delete),
          color: const Color(0xff89c5fd),
          onPressed: onPressed,
        );
  }
}



  class IconePerfil extends StatelessWidget {
  const IconePerfil({super.key});


  @override
  Widget build(BuildContext context) {
    return Icon(
          Icons.account_circle,
          color: Cores.corDoTextoPrincipal(),
          size: 43,

        );
  }
}


class IconePequisa extends StatelessWidget {
  final VoidCallback? onPressed; 

  const IconePequisa({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      color: Cores.corDoTextoPrincipal(),
      onPressed: onPressed,
    );
  }
}

class IconeDeAdicionar extends StatelessWidget {
  final VoidCallback? onPressed; 

  const IconeDeAdicionar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      color: Cores.corDoTextoPrincipal(),
      onPressed: onPressed,
    );
  }
}