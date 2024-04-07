import 'package:flutter/material.dart';

class Cores {
  static Color corDoTextoPrincipal() {
    return const Color(0xffffffff);
  }

  static Color corDoAppBar() {
    return Color.fromARGB(255, 38, 109, 202);
  }

  static BoxDecoration gradientePrincipal(){
  return const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 5, 134, 160), Color.fromARGB(255, 38, 109, 202), Color.fromARGB(255, 9, 126, 134)],
          stops: [0.12, 0.25, 1],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      );
}

}
