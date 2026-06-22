import 'package:iforum/domain/usuario_model.dart';

class FakeUsuario {
  static List<UsuarioModel> usuarios = [
    UsuarioModel(
      id: 1,
      nome: "Pedro Antonio",
      username: "pdrolopes",
      bio:
      "'Não esquecer que por enquanto é tempo de morangos. Sim.'"
          "- Clarice Lispector, A Hora da Estrela.",
      curso: "Informática",
      campus: "Arapiraca",
      seguidores: 27,
      seguindo: 159,
    ),

    UsuarioModel(
      id: 2,
      nome: "José Paulo",
      username: "jpaulo",
      bio: "Grêmio estudantil.",
      curso: "Informática",
      campus: "Arapiraca",
      seguidores: 15,
      seguindo: 50,
    ),
  ];
}
