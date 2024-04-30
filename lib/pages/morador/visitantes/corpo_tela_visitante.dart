import 'package:Condominus/componentes/frame_tile.dart';
import 'package:Condominus/dominio/entidades/visitantes.dart';
import 'package:Condominus/dominio/formatadores.dart';
import 'package:Condominus/modelosDoApp/modelo_texto.dart';
import 'package:Condominus/pages/sindico/usuarios/abrir_info_usuarios.dart';
import 'package:Condominus/provider/morador_provider.dart';
import 'package:Condominus/provider/visitante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CorpoDaTelaDeVisitatesPorUsuario extends StatelessWidget {
  const CorpoDaTelaDeVisitatesPorUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    VisitantesProvider visitantesProvider =
        Provider.of<VisitantesProvider>(context);

    List<Visitantes> visitantes = visitantesProvider.buscarTodos();

    if (visitantesProvider.estaCarregando) {
      return const Center(child: CircularProgressIndicator());
    } else if (visitantesProvider.deuErro) {
      return TextoPersonalizado(visitantesProvider.msgErro);
    } else {
      return ListView.builder(
        itemCount: visitantes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: FrameTile(
              titulo: AlertaDeDados(
                text: visitantes[index].name!,
                visitante: visitantes[index],
              ),
              subTitulo: AlertaDeDados(
                  visitante: visitantes[index],
                  text:
                      'Registrado: ${DateFormatBR.dateFormat(visitantes[index].registrationDate!)}'),
              estaAtivo: false,
            ),
          );
        },
      );
    }
  }
}
