class NoticiaModel {
  String titulo;
  String texto;
  String urlImagem;
  String dataPub;
  String tempo;
  String autor;
  String portal;
  int likes;
  int comentarios;
  String corTema;

  NoticiaModel({
    required this.titulo,
    required this.texto,
    required this.urlImagem,
    required this.dataPub,
    required this.tempo,
    required this.autor,
    required this.portal,
    this.likes = 0,
    this.comentarios = 0,
    this.corTema = '#006b3f',
  });
}
