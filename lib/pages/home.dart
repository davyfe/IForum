import 'package:flutter/material.dart';
import 'package:iforum/domain/PropriedadePost.dart';
import 'package:iforum/widget/buildAppBar.dart';
import 'package:iforum/widget/buildPost.dart';
import 'package:iforum/db/PostDao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PropriedadePost> listaPosts = [];

  @override
  void initState() {
    super.initState();
    // lógica com o await
    loadData();
  }

  loadData() async {
    listaPosts = await PostDao().listarPropriedades();
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BuildAppBar(),
        SliverList.builder(
          itemCount: listaPosts.length,
          itemBuilder: (context, i) => BuildPost(propriedade: listaPosts[i]),
        ),
      ],
    );
  }
}
