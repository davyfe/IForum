import 'package:flutter/material.dart';
import 'package:iforum/widget/buildAppBar.dart';
import 'package:iforum/widget/buildPost.dart';
import 'package:iforum/db/fakePosts.dart';

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
        BuildAppBar(),
        SliverList.builder(
          itemCount: FakePosts.posts.length,
          itemBuilder: (context, i) =>
              BuildPost(propriedade: FakePosts.posts[i]),
        ),
      ],
    );
  }
}