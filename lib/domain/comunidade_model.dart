import 'package:flutter/material.dart'; // por causa do Color

class comunidadeModel {
  int id;
  String nome;
  double membros;
  String descricao;
  Color tema;

  comunidadeModel({
    required this.id,
    required this.nome,
    this.membros = 0,
    required this.descricao,
    required this.tema,
  });
}
