import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/menuConfig.dart';
import 'package:iforum/db/fakeUsuario.dart';
import 'package:iforum/domain/propriedadeUsuario.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  var usuarioAtual = FakeUsuario.usuarios[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Cores.verdeifal,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white, size: 22),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white, size: 28),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: Colors.white, size: 20),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuConfig()),
              );
            },
            icon: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.grey[350],
      body: ListView(
        children: [buildPerfil(usuario: usuarioAtual), _buildAbas()],
      ),
    );
  }

  Widget buildPerfil({required PropriedadeUsuario usuario}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black, Cores.verdeifal],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 45, backgroundColor: Colors.white),
          SizedBox(height: 10),
          Text(
            usuario.nome,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "@${usuario.username}",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Text(
                "${usuario.seguidores}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "Seguidores",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(width: 5),
              Text(
                "· ${usuario.seguindo}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "Seguindo",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            usuario.bio,
            style: TextStyle(fontSize: 15, color: Colors.white),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.school, color: Colors.white, size: 18),
              SizedBox(width: 5),
              Text(
                "Téc. em ${usuario.curso}",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(width: 15),
              Icon(Icons.location_city, color: Colors.white, size: 18),
              SizedBox(width: 5),
              Text(
                "Campus ${usuario.campus}",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAbas() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              indicatorColor: Cores.verdeifal,
              indicatorWeight: 3.0,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [Tab(text: "Posts"), Tab(text: "Comentários")],
            ),
          ),
          SizedBox(
            height: 250,
            child: Container(
              color: Colors.grey[250],
              child: TabBarView(
                children: [
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: "Você não tem\nnenhum post. "),
                          TextSpan(
                            text: "Criar.",
                            style: TextStyle(
                              color: Cores.verdeifal,
                              decoration: TextDecoration.underline,
                              decorationColor: Cores.verdeifal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Você ainda não tem comentários. ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
