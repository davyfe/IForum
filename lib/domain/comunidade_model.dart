import 'package:flutter/material.dart'; // por causa do Color

class ComunidadeModel {
  int id;
  String nome;
  double membros;
  String descricao;
  Color tema;

  ComunidadeModel({
    required this.id,
    required this.nome,
    this.membros = 0,
    required this.descricao,
    required this.tema,
  });
}
