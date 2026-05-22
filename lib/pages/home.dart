import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/criarPost.dart';
import 'package:iforum/domain/PropriedadesPosts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List posts = [
    PropriedadesPosts(
      titulo: 'Estou fazendo uma reformulação da minha tela em dart! :P',
      autor: 'davyf',
      comunidade: 'devs.if',
      tempo: '30m',
      tipo: 'Material',
      conteudo:
          'Recentemente fiz uma tela para apresentação de Programação Móvel, na terça-feira passada, funcionou bem, porém o design me incomodou um pouco. Por isso, agora estou a reformulando, melhorando aspectos tanto do design quando do código.',
      likes: 26,
      comentarios: 5,
    ),
    PropriedadesPosts(
      titulo: 'Rio de Janeiro, RJ, Brasil.',
      autor: 'pdrolopesm',
      comunidade: 'fotografias',
      tempo: '1d',
      tipo: 'outros',
      likes: 504,
      comentarios: 230,
      urlImagem:
          'https://www.daninoce.com.br/wp-content/uploads/2017/07/9-vistas-incriveis-no-rio-de-janeiro-danielle-noce-imagem-destaque.jpg',
    ),
    PropriedadesPosts(
      titulo: 'Achei esse livro fantástico pra ajudar nos estudos!',
      autor: 'sabynna.louyse',
      comunidade: 'estudos.ifal',
      tempo: '1h',
      tipo: 'material',
      likes: 60,
      comentarios: 3,
      anexo: true,
    ),
    PropriedadesPosts(
      titulo:
          'Meu computador não está funcionando... Alguém sabe o que pode ser?',
      autor: 'duarte.geh',
      comunidade: 'monc_ifal',
      tempo: '2s',
      tipo: 'ajuda',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Cores.verdeifal,
          floating: true,
          snap: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: SizedBox(
            height: 40,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Pesquisar',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white, width: 1.5),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => const CriarPost(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(),
          ),
        ),
        SliverList.builder(
          itemCount: posts.length,
          itemBuilder: (context, i) {
            return buildPost(post: posts[i]);
          },
        ),
      ],
    );
  }

  Widget buildPost({required PropriedadesPosts post}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
                  SizedBox(width: 8),
                  Text(
                    post.autor,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 3),
                  Icon(
                    Icons.chevron_right,
                    size: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 3),
                  Text(
                    post.comunidade,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(post.tempo),
                  Spacer(),
                  Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(height: 5),
              Text(
                post.titulo,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              if (post.conteudo.isNotEmpty) ...[
                SizedBox(height: 5),
                Text(
                  post.conteudo,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (post.urlImagem.isNotEmpty) ...[
                SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    post.urlImagem,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => const SizedBox.shrink(),
                  ),
                ),
              ],
              if (post.anexo) ...[
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  width: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black54, width: 0.3),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.picture_as_pdf, color: Colors.red, size: 30),
                      SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            'livro.pdf',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('250mb', textAlign: TextAlign.start),
                        ],
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.file_download_outlined, size: 18),
                    ],
                  ),
                ),
              ],
              SizedBox(height: 8),
              buildInteracao(post.likes, post.comentarios),
            ],
          ),
        ),
        const Divider(color: Colors.black54, thickness: 0.2, height: 1),
      ],
    );
  }

  Widget buildTags(String tipo) {
    return Chip(
      label: Text(
        tipo,
        style: TextStyle(fontWeight: FontWeight.bold, color: _getCor(tipo)),
      ),
      backgroundColor: _getCor(tipo).withValues(alpha: 0.3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.only(left: 4, right: 4),
      side: BorderSide.none,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }

  Color _getCor(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'material':
        return Colors.indigo;
      case 'ajuda':
        return Colors.yellow.shade700;
      case 'dúvida':
        return Colors.red;
      case 'outros':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget buildInteracao(int likes, int comentarios) {
    return Row(
      children: [
        Chip(
          backgroundColor: Cores.fundo,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.thumb_up_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text('$likes |'),
              const SizedBox(width: 8),
              const Icon(
                Icons.thumb_down_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
            ],
          ),
          labelPadding: const EdgeInsets.only(left: 4, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        SizedBox(width: 10),
        Chip(
          backgroundColor: Cores.fundo,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text('$comentarios'),
            ],
          ),
          labelPadding: const EdgeInsets.only(left: 4, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        Spacer(),
        Chip(
          backgroundColor: Cores.fundo,
          label: const Icon(
            Icons.share_outlined,
            size: 16,
            color: Colors.black54,
          ),
          labelPadding: const EdgeInsets.only(left: 2, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ],
    );
  }
}
