import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/criarPost.dart';
import 'package:iforum/domain/PropriedadePost.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
            builder: (BuildContext context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: _buildBarraPesquisa(),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => const CriarPost(),
                  fullscreenDialog: true,
                ),
              ),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(),
          ),
        ),
        SliverList.builder(
          itemCount: posts.length,
          itemBuilder: (context, i) => buildPost(post: posts[i]),
        ),
      ],
    );
  }

  Widget _buildBarraPesquisa() {
    return SizedBox(
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}