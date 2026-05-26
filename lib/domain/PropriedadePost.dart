class PropriedadePosts{
  String titulo;
  String autor;
  String comunidade;
  String tempo;
  String tipo;
  String conteudo;
  int likes;
  int comentarios;
  bool anexo;
  String urlImagem;

  PropriedadePosts({
    required this.titulo,
    required this.autor,
    required this.comunidade,
    required this.tempo,
    required this.tipo,
    this.conteudo="",
    this.likes=0,
    this.comentarios=0,
    this.anexo=false,
    this.urlImagem="",
  });
}