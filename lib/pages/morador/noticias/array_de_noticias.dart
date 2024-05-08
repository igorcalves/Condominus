import 'package:Condominus/dominio/formatadores.dart';

class Noticia {
  final String titulo;
  final String nomeImagem;
  final String texto;

  Noticia({
    required this.titulo,
    required this.nomeImagem,
    required this.texto,
  });
}

List<Noticia> arrayDeNoticias() {
  List<Noticia> noticias = [];

  noticias.add(
    Noticia(
        titulo: 'Elevador Em Manutenção',
        nomeImagem: 'Elevador.jpg',
        texto:
            'Durante o dia ${DateFormatBR.dateFormat(DateTime.now().toString())} haverá manutenção dos Elevadores favor usar as escadas'),
  );

  noticias.add(
    Noticia(
        titulo: 'Novo Espaço: Churrasqueira',
        nomeImagem: 'Churrasqueira.jpg',
        texto:
            'Hoje ${DateFormatBR.dateFormat(DateTime.now().toString())} foi inalgurado o espaço "Churrasqueira" Agende já seu Horario'),
  );

  noticias.add(
    Noticia(
        titulo: 'Condominio solidário',
        nomeImagem: 'Doacao.jpg',
        texto:
            'O Cominio está realizando uma ação para ajudar os menus afortunados leve suas doação ao hall '),
  );

  return noticias;
}
