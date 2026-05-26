import 'package:flutter/material.dart'; // por causa do Color

class PropriedadesComunidades {
  String nome;
  double membros;
  String descricao;
  Color corAvatar;

  PropriedadesComunidades({
    required this.nome,
    required this.membros,
    required this.descricao,
    required this.corAvatar,
  });
}