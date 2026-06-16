// lib/pages/home.dart
import 'package:flutter/material.dart';
import 'package:iforum/domain/post_model.dart';
import 'package:iforum/widget/buildAppBar.dart';
import 'package:iforum/widget/buildPost.dart';
import 'package:iforum/db/PostDao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<PostModel>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = PostDao().listarTodos();
  }

  // par anovos posts
  void _recarregar() {
    setState(() {
      _postsFuture = PostDao().listarTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BuildAppBar(onPostCriado: _recarregar),
        SliverFillRemaining(
          child: FutureBuilder<List<PostModel>>(
            future: _postsFuture,
            builder: (context, snapshot) {
              // carregando
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              // erro
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                        size: 48,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Erro ao carregar posts',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        snapshot.error.toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              }

              // lista vazia
              final posts = snapshot.data ?? [];
              if (posts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.article_outlined,
                        color: Colors.grey,
                        size: 48,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Nenhum post ainda.',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              }

              // lista com dados
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: posts.length,
                itemBuilder: (context, i) => BuildPost(propriedade: posts[i]),
              );
            },
          ),
        ),
      ],
    );
  }
}
