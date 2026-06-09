class PropriedadePost {
  late String titulo;
  late String autor;
  late String comunidade;
  late String tempo;
  late String tipo;
  late String conteudo;
  late int likes;
  late int comentarios;
  late bool anexo;
  late String urlImagem;

  PropriedadePost({
    required this.titulo,
    required this.autor,
    required this.comunidade,
    required this.tempo,
    required this.tipo,
    this.conteudo = "",
    this.likes = 0,
    this.comentarios = 0,
    this.anexo = false,
    this.urlImagem = "",
  });

  PropriedadePost.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    autor = json['autor'];
    comunidade = json['comunidade'];
    tempo = json['tempo'];
    tipo = json['tipo'];
    conteudo = json['conteudo'] ?? "";
    likes = json['likes'] ?? 0;
    comentarios = json['comentarios'] ?? 0;
    urlImagem = json['urlImagem'] ?? "";
    // para booleano
    anexo = json['anexo'] == 1 || json['anexo'] == true;
  }
}
