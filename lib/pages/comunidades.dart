import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/db/fakeComunidades.dart';
import 'package:iforum/widget/buildComunidades.dart'; // Importando o arquivo de widgets que criamos

class Comunidades extends StatelessWidget {
  const Comunidades({super.key});

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
              "Comunidades",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {},),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Explore comunidades por assuntos",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SecaoTopicos(topicos: FakeComunidades.topicos),
                  ListaComunidades(lista: FakeComunidades.comunidades),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}