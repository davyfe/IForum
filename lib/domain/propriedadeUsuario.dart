class PropriedadeUsuario {
  final int id;
  final String nome;
  final String username;
  final String bio;
  final String curso;
  final String campus;
  final int seguidores;
  final int seguindo;

  const PropriedadeUsuario({
    required this.id,
    required this.nome,
    required this.username,
    this.bio = "",
    required this.curso,
    required this.campus,
    this.seguidores = 0,
    this.seguindo = 0,
  });
}
