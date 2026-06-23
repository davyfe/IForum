class ComentarioModel {
  int noticiaId;
  String autor;
  String tempo;
  String texto;
  int likes;
  int comentarios;
  String reacao;

  ComentarioModel({
    required this.noticiaId,
    required this.autor,
    required this.tempo,
    required this.texto,
    required this.likes,
    required this.comentarios,
    required this.reacao,
  });
}
