import 'package:flutter/material.dart';

class Cores {
  static Color corDoTextoPrincipal() {
    return const Color(0xffffffff);
  }

  static Color corDoAppBar() {
    return const Color(0xff3fedfb);
  }

  static BoxDecoration gradientePrincipal(){
  return const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff41dcfb), Color(0xff45edd9), Color(0xff3fedfb)],
          stops: [0.12, 0.25, 1],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      );
}

}
