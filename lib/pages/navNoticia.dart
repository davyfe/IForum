import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/PropriedadeNoticia.dart';
import 'package:iforum/domain/PropriedadesComentario.dart';
import 'package:iforum/widget/buildNavNoticia.dart';

//recebe a noticia da tela anterior via construtor
//final = não muda
//required = é obrigatório
class NavNoticia extends StatefulWidget {
  final PropriedadesNoticia noticia;
  const NavNoticia({super.key, required this.noticia});

  @override
  State<NavNoticia> createState() => _NavNoticiaState();
}

class _NavNoticiaState extends State<NavNoticia> {

  //lista para guardar os objetos de notícia em que cada noticia é uma instancia do dominio prorpriedadecomentario
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

  //a lista vai percorrer comentarios e manter só o que for verdadeiro: se o
  // comentário pertence à notícia aberta, e o resultado é convertido pra List
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

            //appbar fica presa no topo ao rolar, encolhe mas não some
            pinned: true,
            //altura máxima da appbar quando expandida
            expandedHeight: 300.0,
            //expande e encolhe ao rolar, onde está a imagem
            flexibleSpace: FlexibleSpaceBar(

              //colocar os widgets uns em cima dos outros e a ordem importa: o primeiro fica embaixo e o último em cima
              background: Stack(

                //para ocupar todo o espaco disponivel do stack
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.noticia.urlImagem,

                    //preenche o espaco inteiro sem distorcer e pode cortar as bordas
                    fit: BoxFit.cover,
                    //se a imagem não abrir, usa um widget invisível de tamanho zero (some silenciosamnete)
                    errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                  ),

                  //aqui arruma as cores
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      //gradiente vai de uma cor a outra em linha reta
                      gradient: LinearGradient(
                        //de cima para baixo
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        //começa transparente e termina preto
                        colors: [Colors.transparent, Colors.black87],
                        //transparente em até 30% de altura e o preto começa depois daí
                        stops: [0.3, 1.0],
                      ),
                    ),
                  ),

                  //posiciona um filho do stack em um lugar exato
                  //titulo e autor no canto inferior
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
                              style: const TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              Icons.chevron_right, size: 15, color: Colors.white,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              widget.noticia.portal,
                              style: const TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //botoes de ação ficam no topo
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,

                    //para que o conteúdo não fique escondido
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined, color: Colors.white)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.share_outlined, size: 20, color: Colors.white)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.flag_outlined, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //adicionei este bloco para gerar o resto do conteúdo da notícia
          //transforma qualquer widget comum em sliver pra colocar ele dentro do customscrollview
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Publicado em ${widget.noticia.dataPub}",
                    style: const TextStyle(fontSize: 16, color: Colors.black38, fontStyle: FontStyle.italic),
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
          )
        ],
      ),
    );
  }

  Widget _buildComentarios() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comentariosDaNoticia
          //percorre cada comentário e transforma em um widget
          .map((c) => BuildNavNoticia(comentario: c))
          //converte o resultado para list já que o column espera isso
          .toList(),
    );
  }
}