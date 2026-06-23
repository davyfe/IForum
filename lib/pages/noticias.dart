import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/db/NoticiaDao.dart';
import 'package:iforum/domain/noticia_model.dart';
import 'package:iforum/widget/buildNoticia.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  //variavel que armazena as noticias
  late Future<List<NoticiaModel>> _noticiasFuture;

  @override
  //função que abre o banco de dados
  void initState() {
    //passa todas as informações para o banco
    super.initState();
    //armazena a lista de posts que a função listar todos retornou
    _noticiasFuture = NoticiaDao().listarTodos();
  }

  void _recarregar() {
    setState(() {
      _noticiasFuture = NoticiaDao().listarTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Cores.verdeifal,
            floating: true,
            snap: true,
            title: const Text(
              'Notícias',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh_outlined),
                onPressed: _recarregar,
              ),
              IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {},
              ),
            ],
          ),
          SliverFillRemaining(
            //metodo futuro que vai retornar a lista para a tela
            child: FutureBuilder<List<NoticiaModel>>(
              future: _noticiasFuture,
              //snaoshot = "print" da tela
              builder: (context, snapshot) {
                //verifica se está carregando
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                //erro
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline, color: Colors.grey, size: 48),
                        const SizedBox(height: 8),
                        Text('Erro ao carregar notícias',
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  );
                }

                //caso dê certo, é criado uma lista
                //snaphot.data = armazena o conteúdo de noticiaFuture
                //?? [] = se der errado, cria lista vazia
                final noticias = snapshot.data ?? [];
                //se for vazio (sem noticias)
                if (noticias.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.newspaper_outlined, color: Colors.grey, size: 48),
                        const SizedBox(height: 8),
                        Text('Nenhuma notícia disponível.',
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  );
                }

                //se estiver ok
                //gera a tela de acordo com a quantidade de post
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: noticias.length,
                  itemBuilder: (context, i) {
                    return BuildNoticia(noticia: noticias[i]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}