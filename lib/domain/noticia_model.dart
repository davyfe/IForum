import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';

class NoticiaModel {
  final int? id;
  final String titulo;
  final String texto;
  final String urlImagem;
  final String dataPub;
  final String tempo;
  final String autor;
  final String portal;
  final int likes;
  final int comentarios;
  final String corTema;

  const NoticiaModel({
    this.id,
    required this.titulo,
    required this.texto,
    required this.urlImagem,
    required this.dataPub,
    required this.tempo,
    required this.autor,
    required this.portal,
    this.likes = 0,
    this.comentarios = 0,
    this.corTema = '#006b3f',
  });

  Color get tema {
    try {
      final hex = corTema.replaceFirst('#', '');
      return Color(int.parse('FF$hex', radix: 16));
    } catch (_) {
      return Cores.verdeifal;
    }
  }

  factory NoticiaModel.fromJson(Map<String, dynamic> json) {
    return NoticiaModel(
      id:          json['id']          as int?,
      titulo:      json['titulo']      as String,
      texto:       json['texto']       as String,
      urlImagem:   json['urlImagem']   as String? ?? '',
      dataPub:     json['dataPub']     as String? ?? '',
      tempo:       json['tempo']       as String? ?? '',
      autor:       json['autor']       as String? ?? '',
      portal:      json['portal']      as String? ?? '',
      likes:       json['likes']       as int? ?? 0,
      comentarios: json['comentarios'] as int? ?? 0,
      corTema:     json['corTema']     as String? ?? '#006b3f',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo':      titulo,
      'texto':       texto,
      'urlImagem':   urlImagem,
      'dataPub':     dataPub,
      'tempo':       tempo,
      'autor':       autor,
      'portal':      portal,
      'likes':       likes,
      'comentarios': comentarios,
      'corTema':     corTema,
    };
  }
}