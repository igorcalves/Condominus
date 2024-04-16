import 'package:flutter/material.dart';

class Cores {
  static Color corDoTextoPrincipal() {
    return const Color(0xffffffff);
  }

  static Color corDoAppBar() {
    return const Color.fromARGB(255, 38, 109, 202);
  }

  static Color corDoAlertDialog({double opacidade = 0.8}) {
    return const Color.fromARGB(121, 11, 67, 172).withOpacity(opacidade);
  }

  static BoxDecoration gradientePrincipal() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 5, 134, 160),
          Color.fromARGB(255, 38, 109, 202),
          Color.fromARGB(255, 9, 126, 134)
        ],
        stops: [0.12, 0.25, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ),
    );
  }

  static BoxDecoration gradienteAppBar() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 3, 124, 155),
          Color.fromARGB(255, 3, 124, 155),
          Color.fromARGB(255, 9, 126, 134)
        ],
        stops: [0.2, 0.25, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ),
    );
  }
}
