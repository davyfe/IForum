class UsuarioModel {
  late int id;
  late String nome;
  late String username;
  late String bio;
  late String curso;
  late String campus;
  late int seguidores;
  late int seguindo;

  UsuarioModel({
    required this.id,
    required this.nome,
    required this.username,
    this.bio = '',
    this.curso = '',
    this.campus = '',
    this.seguidores = 0,
    this.seguindo = 0,
  });

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    username = json['username'];
    bio = json['bio'] ?? '';
    curso = json['curso'] ?? '';
    campus = json['campus'] ?? '';
    seguidores = json['seguidores'] ?? 0;
    seguindo = json['seguindo'] ?? 0;
  }
}
