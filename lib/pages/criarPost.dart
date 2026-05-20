import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';

class CriarPost extends StatefulWidget{
  const CriarPost({super.key});

  @override
  State<CriarPost> createState() => _CriarPostState();
}

class _CriarPostState extends State<CriarPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          ElevatedButton(onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Cores.verdeifal,
                shape: const StadiumBorder(),
                elevation: 0,
                minimumSize: const Size(0, 30),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0)
            ),
            child: const Text("Postar", style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold
            )),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 15),
        backgroundColor: Cores.fundo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenu(),
                    const SizedBox(height: 5),
                    const TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Digite um título...',
                        hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Texto do post (opcional)',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBarraFormatacao(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      height: 35,
      padding: const EdgeInsets.only(left: 15, right: 8, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Selecionar Comunidade", style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Icon(Icons.unfold_more, color: Colors.black, size: 20),
        ]
      )
    );
  }

  Widget _buildBarraFormatacao() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.format_bold, color: Colors.black),
          Icon(Icons.format_italic, color: Colors.black),
          Icon(Icons.format_underline, color: Colors.black),
          Icon(Icons.format_size, color: Colors.black),
          Icon(Icons.strikethrough_s, color: Colors.black),
          Icon(Icons.format_list_bulleted, color: Colors.black),
          Icon(Icons.link, color: Colors.black),
          Icon(Icons.attach_file, color: Colors.black),
          Icon(Icons.image, color: Colors.black),
          Icon(Icons.play_circle_filled, color: Colors.black),
        ],
      ),
    );
  }
}