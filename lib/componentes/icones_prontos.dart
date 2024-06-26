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

class IconeDeReverterDelecao extends StatelessWidget {
  const IconeDeReverterDelecao({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.replay),
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

Icon iconePiscina() {
  return Icon(Icons.pool, color: Cores.corDoTextoPrincipal(), size: 27);
}

Icon iconeAreaDeTrabalho() {
  return Icon(Icons.laptop_mac, color: Cores.corDoTextoPrincipal(), size: 27);
}

Icon iconeSalaoDeFestas() {
  return Icon(Icons.celebration, color: Cores.corDoTextoPrincipal(), size: 27);
}

Icon iconeChurrassqueira() {
  return Icon(Icons.outdoor_grill,
      color: Cores.corDoTextoPrincipal(), size: 27);
}

CircleAvatar iconeDePerfil() {
  return const CircleAvatar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.blue,
    child: Icon(Icons.person),
  );
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

Icon escolherItemDaReserva(int id) {
  if (id == 0)
    return iconeChurrassqueira();
  else if (id == 1)
    return iconePiscina();
  else if (id == 2)
    return iconeAreaDeTrabalho();
  else
    return iconeSalaoDeFestas();
}
