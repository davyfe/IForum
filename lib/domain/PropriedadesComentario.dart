import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';

class PropriedadesComentario {
  int noticiaId;
  String autor;
  String tempo;
  String texto;
  int likes;
  int comentarios;
  String reacao;

   PropriedadesComentario ({
    required this.noticiaId,
    required this.autor,
    required this.tempo,
    required this.texto,
    required this.likes,
    required this.comentarios,
    required this.reacao,
});
}