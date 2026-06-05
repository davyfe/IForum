import 'package:flutter/material.dart'; // por causa do Color

class PropriedadeComunidade {
  String nome;
  double membros;
  String descricao;
  Color tema;

  PropriedadeComunidade({
    required this.nome,
    required this.membros,
    required this.descricao,
    required this.tema,
  });
}