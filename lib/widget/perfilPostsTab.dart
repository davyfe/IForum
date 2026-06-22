import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/db/PostDao.dart';
import 'package:iforum/domain/post_model.dart';
import 'package:iforum/widget/buildPost.dart';

class PerfilPostsTab extends StatefulWidget {
  final String autor;

  const PerfilPostsTab({super.key, required this.autor});

  @override
  State<PerfilPostsTab> createState() => _PerfilPostsTabState();
}

class _PerfilPostsTabState extends State<PerfilPostsTab>
    with AutomaticKeepAliveClientMixin {
  late Future<List<PostModel>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = PostDao().listarPorAutor(widget.autor);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder<List<PostModel>>(
      future: _postsFuture,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: Colors.grey, size: 48),
                const SizedBox(height: 8),
                Text(
                  'Erro ao carregar posts',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        final posts = snapshot.data ?? [];

        if (posts.isEmpty) {
          return Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(text: 'Você não tem\nnenhum post. '),
                  TextSpan(
                    text: 'Criar.',
                    style: TextStyle(
                      color: Cores.verdeifal,
                      decoration: TextDecoration.underline,
                      decorationColor: Cores.verdeifal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: posts.length,
          itemBuilder: (context, i) => BuildPost(propriedade: posts[i]),
        );
      },
    );
  }
}