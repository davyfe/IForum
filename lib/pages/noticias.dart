import 'package:flutter/material.dart';
import 'package:iforum/domain/noticia_model.dart';
import 'package:iforum/pages/navNoticia.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/widget/interacaoBar.dart';
import 'package:iforum/db/fakeNoticias.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: const Text("Notícias"),
            actions: [
              IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {},
              ),
            ],
          ),
          SliverList.builder(
            itemCount: FakeNoticias.noticias.length,
            itemBuilder: (context, i) {
              return buildNoticia(
                context: context,
                noticia: FakeNoticias.noticias[i],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildNoticia({
    required BuildContext context,
    required NoticiaModel noticia,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavNoticia(noticia: noticia)),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 10,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
                    const SizedBox(width: 8),
                    Text(
                      noticia.autor,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Text(noticia.tempo),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
                const SizedBox(height: 5),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        noticia.titulo,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        noticia.urlImagem,
                        width: 120,
                        height: 102,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                InteracaoBar(
                  likes: noticia.likes,
                  comentarios: noticia.comentarios,
                  trailing: const Icon(
                    Icons.share_outlined,
                    size: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        ],
      ),
    );
  }
}
