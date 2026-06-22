class UsuarioModel {
  final int id;
  final String nome;
  final String username;
  final String bio;
  final String curso;
  final String campus;
  final int seguidores;
  final int seguindo;

  const UsuarioModel({
    required this.id,
    required this.nome,
    required this.username,
    this.bio = "",
    required this.curso,
    required this.campus,
    this.seguidores = 0,
    this.seguindo = 0,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id:         json['id']         as int,
      nome:       json['nome']       as String,
      username:   json['username']   as String,
      bio:        json['bio']        as String? ?? '',
      curso:      json['curso']      as String? ?? '',
      campus:     json['campus']     as String? ?? '',
      seguidores: json['seguidores'] as int? ?? 0,
      seguindo:   json['seguindo']   as int? ?? 0,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'nome':       nome,
      'username':   username,
      'bio':        bio,
      'curso':      curso,
      'campus':     campus,
      'seguidores': seguidores,
      'seguindo':   seguindo,
    };
  }
}
