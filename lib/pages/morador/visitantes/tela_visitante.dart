import 'package:Condominus/componentes/frame_superior_busca.dart';
import 'package:Condominus/modelosDoApp/modelo_cores.dart';
import 'package:Condominus/pages/morador/visitantes/corpo_tela_visitante.dart';
import 'package:Condominus/provider/visitante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaDeVisitantesPorMorador extends StatelessWidget {
  const TelaDeVisitantesPorMorador({super.key});

  @override
  Widget build(BuildContext context) {
    VisitantesProvider visitantesProvider =
        Provider.of<VisitantesProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff89c5fd),
            brightness: Brightness.dark,
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.white.withOpacity(0.4),
            selectionHandleColor: Colors.blue,
          )),
      home: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          decoration: Cores.gradientePrincipal(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CampoDeBusca(onPressedPesquisa: (String texto) {
                visitantesProvider.trocarEstadoCarregamento();
                visitantesProvider.escolherTipoDeBusca('47776777777');
              }),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                  height: 729, child: CorpoDaTelaDeVisitatesPorUsuario()),
              const SizedBox(
                height: 300,
              )
            ],
          ),
        ),
      )),
    );
  }
}
