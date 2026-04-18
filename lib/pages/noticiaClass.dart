import 'package:iforum/noticias.dart';

//criando uma classe para definir as informações obrigatórias
class noticiaClass {
  final String usuario;
  final String tempo;
  final String titulo;
  final String imagem;
  final int curtidas;
  final int comentarios;


  noticiaClass({
    required this.usuario,
    required this.tempo,
    required this.titulo,
    required this.imagem,
    required this.curtidas,
    required this.comentarios,
  });
}

//final = o que for definido não pode ser mudado
//required = dados obrigatórios para a notícia

