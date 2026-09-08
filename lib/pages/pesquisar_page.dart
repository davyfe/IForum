import 'package:flutter/material.dart';
import 'package:iforum/widget/build_text.dart';
import '/db/post_dao.dart';
import '/domain/post.dart';
import '/widget/build_post.dart';
import '/cores.dart';

class pesquisar_page extends StatefulWidget {
  const pesquisar_page({super.key});

  @override
  State<StatefulWidget> createState() => _pesquisar_pageState();
}

class _pesquisar_pageState extends State<pesquisar_page> {
  final _searchController = TextEditingController();

  // começa vazio pra não disparar busca antes do usuário digitar nada
  Future<List<Post>> futureListaPosts = Future.value([]);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _buscar(String nome) {
    setState(() {
      futureListaPosts = PostDao().buscarPorTitulo(nome.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: _buildSearchField(),
        backgroundColor: Cores.verde,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
        future: futureListaPosts,
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
                  BuildText('Erro ao carregar posts', color: Colors.red),
                  BuildText(snapshot.error.toString(), color: Colors.red),
                ],
              ),
            );
          }
          if (snapshot.hasData) {
            List<Post> listaPosts = snapshot.requireData;
            if (listaPosts.isEmpty) {
              return Center(
                child: BuildText(
                  _searchController.text.isEmpty
                      ? 'Digite um título para pesquisar'
                      : 'Nenhum post encontrado',
                  color: Colors.grey,
                ),
              );
            }
            return buildListView(listaPosts);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  ListView buildListView(listaPosts) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: listaPosts.length,
      itemBuilder: (context, i) => BuildPost(post: listaPosts[i]),
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: _searchController,
        autofocus: true,
        onChanged: _buscar,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Nome inicial do post',
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
}
