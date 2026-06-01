import 'package:flutter/material.dart';
import 'package:iforum/domain/PropriedadeComunidade.dart';

class FakeComunidades {
  static List comunidades = [
    PropriedadeComunidade(
      nome: "DevsIf",
      membros: 5.6,
      descricao:
          "Comunidade de desenvolvimento to Ifal Campus Arapiraca! Compartilhe seus projetos, tire dúvidas e +!",
      tema: Colors.indigo,
    ),
    PropriedadeComunidade(
      nome: "Xadrez Arapiraca",
      membros: 1.0,
      descricao:
          "Para quem curte estratégia! Treinos, campeonatos de xadrez e desafios de lógica para fritar o cérebro.",
      tema: Colors.yellow.shade700,
    ),
    PropriedadeComunidade(
      nome: "Ifal Games",
      membros: 3.2,
      descricao:
          "Para os apaixonados por jogos! Organização de campeonatos de eSports, discussões e jogatinas do campus.",
      tema: Colors.purple,
    ),
    PropriedadeComunidade(
      nome: "Cine Ifal",
      membros: 1.4,
      descricao:
          "Clube de cinema e cultura pop. Discussões sobre filmes, séries, animes e produções autorais dos alunos.",
      tema: Colors.red,
    ),
    PropriedadeComunidade(
      nome: "Vôlei IFAL",
      membros: 10.1,
      descricao:
          "A comunidade do esporte mais famoso do campus! Fique por dentro dos treinos, rachas e das datas do interclasses.",
      tema: Colors.brown.shade200,
    ),
    PropriedadeComunidade(
      nome: "Bate-Papo",
      membros: 12.5,
      descricao:
          "O ponto de encontro geral dos estudantes. Conversas aleatórias, memes e novas amizades no campus.",
      tema: Colors.green,
    ),
  ];

  static List<String> topicos = [
    "Cultura", "Filmes e TV", "Cultura pop", "Jogos", "Tecnologia", "Esportes",
    "Bate-Papo", "Desenvolvimento", "Notícias e política", "Ciências Exatas", "Botânica",
    "Eletrônica", "Negócios e finanças", "Ciências Humanas", "Arte"
  ];
}
