import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/noticia_model.dart';
import 'package:iforum/domain/PropriedadesComentario.dart';
import 'package:iforum/widget/buildNavNoticia.dart';

class NavNoticia extends StatefulWidget {
  final NoticiaModel noticia;
  const NavNoticia({super.key, required this.noticia});

  @override
  State<NavNoticia> createState() => _NavNoticiaState();
}

class _NavNoticiaState extends State<NavNoticia> {
  List<PropriedadesComentario> comentarios = [
    PropriedadesComentario(
      noticiaId: 1,
      autor: "camila_rosa",
      tempo: "15m",
      texto: "Os comentários são todos iguais!! Estamos em uma matrix??!!",
      likes: 16,
      comentarios: 2,
      reacao: "😱",
    ),
    PropriedadesComentario(
      noticiaId: 1,
      autor: "mauro.coelho",
      tempo: "7m",
      texto: "Que besteira dessa camila...",
      likes: 8,
      comentarios: 2,
      reacao: "😤",
    ),
    PropriedadesComentario(
      noticiaId: 1,
      autor: "remus_lupim",
      tempo: "2m",
      texto: "Pessoal... Vamos prestar atenção na matéria.",
      likes: 12,
      comentarios: 1,
      reacao: "🌕",
    ),
    PropriedadesComentario(
      noticiaId: 1,
      autor: "katniss.everdeen12",
      tempo: "30s",
      texto: "Are you, are you coming to the tree?",
      likes: 3,
      comentarios: 0,
      reacao: "🥺",
    ),
  ];

  List<PropriedadesComentario> get comentariosDaNoticia =>
      comentarios.where((c) => c.noticiaId == widget.noticia.id).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: widget.noticia.tema,
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.noticia.urlImagem,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                        stops: [0.3, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.noticia.titulo,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "Por ${widget.noticia.autor}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(width: 3),
                            const Icon(Icons.chevron_right,
                                size: 15, color: Colors.white),
                            const SizedBox(width: 3),
                            Text(
                              widget.noticia.portal,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search_outlined,
                                  color: Colors.white)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share_outlined,
                                  size: 20, color: Colors.white)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.flag_outlined,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Publicado em ${widget.noticia.dataPub}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.noticia.texto,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 30),
                  Text("Comentários (${comentariosDaNoticia.length})"),
                  _buildComentarios(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComentarios() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comentariosDaNoticia
          .map((c) => BuildNavNoticia(comentario: c))
          .toList(),
    );
  }
}