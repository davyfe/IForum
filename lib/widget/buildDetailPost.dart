import 'package:flutter/material.dart';
import '../domain/PropriedadePost.dart';


class BuildDetailPost extends StatefulWidget {
  PropriedadePost propriedade;
  BuildDetailPost({super.key, required this.propriedade});

  @override
  State<BuildDetailPost> createState() => _BuildDetailPostState();
}

class _BuildDetailPostState extends State<BuildDetailPost>{
  PropriedadePost get propriedade => widget.propriedade;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      ],
    );
  }
}