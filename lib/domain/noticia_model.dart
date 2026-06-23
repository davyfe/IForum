import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';

class NoticiaModel {
  late int? id;
  late String titulo;
  late String texto;
  late String urlImagem;
  late String dataPub;
  late String tempo;
  late String autor;
  late String portal;
  late int likes;
  late int comentarios;
  late String corTema;

  NoticiaModel({
    this.id,
    required this.titulo,
    required this.texto,
    this.urlImagem = '',
    this.dataPub = '',
    this.tempo = '',
    this.autor = '',
    this.portal = '',
    this.likes = 0,
    this.comentarios = 0,
    this.corTema = '#006b3f',
  });

  NoticiaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    texto = json['texto'];
    urlImagem = json['urlImagem'] ?? '';
    dataPub = json['dataPub'] ?? '';
    tempo = json['tempo'] ?? '';
    autor = json['autor'] ?? '';
    portal = json['portal'] ?? '';
    likes = json['likes'] ?? 0;
    comentarios = json['comentarios'] ?? 0;
    corTema = json['corTema'] ?? '#006b3f';
  }

  Color get tema {
    try {
      final hex = corTema.replaceFirst('#', '');
      return Color(int.parse('FF$hex', radix: 16));
    } catch (_) {
      return Cores.verdeifal;
    }
  }
}
