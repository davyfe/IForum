import 'package:flutter/material.dart';
import 'package:iforum/domain/post_model.dart';
import 'package:iforum/widget/buildPost.dart';
import 'package:iforum/db/PostDao.dart';
import 'package:iforum/pages/criarPost.dart';

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

  void _recarregar() {
    setState(() {
      _postsFuture = PostDao().listarTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildAppBar(),
        SliverFillRemaining(
          child: FutureBuilder<List<PostModel>>(
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

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      leading: _buildLeading(),
      title: _buildPesquisar(),
      actions: [_buildAction()],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: SizedBox(),
      ),
    );
  }

  Widget _buildPesquisar() {
    return SizedBox(
      height: 40,
      child: TextField(
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Pesquisar',
          hintStyle: TextStyle(
            color: Theme.of(
              context,
            ).colorScheme.onPrimary.withValues(alpha: 0.7),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeading() {
    return Builder(
      builder:
          (BuildContext context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
    );
  }

  Widget _buildAction() {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () async {
        final criou = await Navigator.of(
          context,
          rootNavigator: true,
        ).push<bool>(
          MaterialPageRoute(
            builder: (context) => const CriarPost(),
            fullscreenDialog: true,
          ),
        );
        if (criou == true) {
          _recarregar();
        }
      },
    );
  }
}
