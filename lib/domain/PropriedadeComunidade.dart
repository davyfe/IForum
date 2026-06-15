import 'package:flutter/material.dart'; // por causa do Color

class PropriedadeComunidade {
  int id;
  String nome;
  double membros;
  String descricao;
  Color tema;

  PropriedadeComunidade({
    required this.id,
    required this.nome,
    this.membros = 0,
    required this.descricao,
    required this.tema,
  });
}