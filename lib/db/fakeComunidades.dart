import 'package:flutter/material.dart';
import 'package:iforum/domain/comunidade_model.dart';

class FakeComunidades {
  static List comunidades = [
    comunidadeModel(
      id: 1,
      nome: "DevsIf",
      membros: 5.6,
      descricao:
          "Comunidade de desenvolvimento to Ifal Campus Arapiraca! Compartilhe seus projetos, tire dúvidas e +!",
      tema: Colors.indigo,
    ),
    comunidadeModel(
      id: 2,
      nome: "Xadrez Arapiraca",
      membros: 1.0,
      descricao:
          "Para quem curte estratégia! Treinos, campeonatos de xadrez e desafios de lógica para fritar o cérebro.",
      tema: Colors.yellow.shade700,
    ),
    comunidadeModel(
      id: 3,
      nome: "Estudos Ifal",
      membros: 3.2,
      descricao:
          "Compartilhamos materiais, debatemos assuntos e + (NÃO PASSAMOS COLA!!!)",
      tema: Colors.purple,
    ),
    comunidadeModel(
      id: 4,
      nome: "Cine Ifal",
      membros: 1.4,
      descricao:
          "Clube de cinema e cultura pop. Discussões sobre filmes, séries, animes e produções autorais dos alunos.",
      tema: Colors.red,
    ),
    comunidadeModel(
      id: 5,
      nome: "Vôlei IFAL",
      membros: 10.1,
      descricao:
          "A comunidade do esporte mais famoso do campus! Fique por dentro dos treinos, rachas e das datas do interclasses.",
      tema: Colors.brown.shade200,
    ),
    comunidadeModel(
      id: 6,
      nome: "Fotografias",
      membros: 12.5,
      descricao:
          "Para os amantes da fotografia! O que as lentes não veem, o coração não sente!",
      tema: Colors.green,
    ),
  ];

  static List<String> topicos = [
    "Cultura",
    "Filmes e TV",
    "Cultura pop",
    "Jogos",
    "Tecnologia",
    "Esportes",
    "Bate-Papo",
    "Desenvolvimento",
    "Notícias e política",
    "Ciências Exatas",
    "Botânica",
    "Eletrônica",
    "Negócios e finanças",
    "Ciências Humanas",
    "Arte",
  ];
}
