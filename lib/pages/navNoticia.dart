import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/noticia_model.dart';
import 'package:iforum/widget/interacaoBar.dart';

class NavNoticia extends StatefulWidget {
  final NoticiaModel noticia;

  const NavNoticia({super.key, required this.noticia});

  @override
  State<NavNoticia> createState() => _NavNoticiaState();
}

class _NavNoticiaState extends State<NavNoticia> {
  Color _hexParaCor(String hex) {
    final h = hex.replaceAll('#', '');
    return Color(int.parse('FF$h', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: _hexParaCor(widget.noticia.corTema),
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.noticia.urlImagem,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => const SizedBox.shrink(),
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
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              Icons.chevron_right,
                              size: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              widget.noticia.portal,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
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
                            icon: const Icon(
                              Icons.search_outlined,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.flag_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Adicionei este bloco para renderizar o resto do conteúdo da notícia
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
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.noticia.texto,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 30),
                  Text("Comentários (5)"),
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
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
            SizedBox(width: 8),
            Text("camila_rosa", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Text("15m"),
            Spacer(),
            Icon(Icons.more_horiz),
          ],
        ),
        SizedBox(height: 5),
        Text(
          "Os comentários são todos iguais!! Estamos em uma matrix??!!",
          style: TextStyle(fontSize: 15),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),
        InteracaoBar(
          likes: 16,
          comentarios: 2,
          trailing: const Text("😱", style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 10),
        const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
            SizedBox(width: 8),
            Text("mauro.coelho", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Text("7m"),
            Spacer(),
            Icon(Icons.more_horiz),
          ],
        ),
        SizedBox(height: 5),
        Text(
          "Que besteira dessa camila...",
          style: TextStyle(fontSize: 15),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),
        InteracaoBar(
          likes: 8,
          comentarios: 2,
          trailing: const Text("😤", style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 10),
        const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
            SizedBox(width: 8),
            Text("remus_lupim", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Text("2m"),
            Spacer(),
            Icon(Icons.more_horiz),
          ],
        ),
        SizedBox(height: 5),
        Text(
          "Pessoal... Vamos prestar atenção na matéria.",
          style: TextStyle(fontSize: 15),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),
        InteracaoBar(
          likes: 12,
          comentarios: 1,
          trailing: const Text("🌕", style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 10),
        const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
            SizedBox(width: 8),
            Text(
              "katniss.everdeen12",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Text("30s"),
            Spacer(),
            Icon(Icons.more_horiz),
          ],
        ),
        SizedBox(height: 5),
        Text(
          "Are you, are you coming to the tree?",
          style: TextStyle(fontSize: 15),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),
        InteracaoBar(
          likes: 3,
          comentarios: 0,
          trailing: const Text("🥺", style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
