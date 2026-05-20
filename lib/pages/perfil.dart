import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/menuConfig.dart';

class Perfil extends StatefulWidget{
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Cores.verdeifal,
        actions: [
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.black87.withValues(alpha: 0.6),
              ),
              onPressed: (){},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )
          ),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.black87.withValues(alpha: 0.6),
              ),
              onPressed: (){},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )
          ),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.black87.withValues(alpha: 0.6),
              ),
              onPressed: (){},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )
          ),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.black87.withValues(alpha: 0.6),
              ),
              onPressed: (){},
              icon: Icon(
                Icons.share,
                color: Colors.white,
              )
          ),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.black87.withValues(alpha: 0.6),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuConfig()),
                );
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              )
          ),
        ],
      ),
      backgroundColor: Colors.grey[350],
      body: ListView(
        children: [
          buildPerfil(
              nome: "Pedro Antonio",
              user: "pdrolopes",
              seguidores: 27,
              seguindo: 159,
              bio: "'Não esquecer que por enquanto é tempo de morangos. Sim.'"
                  "- Clarice Lispector, A Hora da Estrela.",
              curso: "Informática",
              campus: "Arapiraca",
          ),
          _buildAbas(),
        ],
      ),
    );
  }

  Widget buildPerfil({
    required String nome,
    required String user,
    required int seguidores,
    required int seguindo,
    required String bio,
    required String curso,
    required String campus,
  }) {
    return Container(
      width: double.infinity,
      height: 320,
      padding: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            Cores.verdeifal,
          ]
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 45, backgroundColor: Colors.white,),
          SizedBox(height: 10),
          Text(nome, style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
          Text("@$user", style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
          SizedBox(height: 2),
          Row(
            children: [
              Text("$seguidores", style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
              SizedBox(width: 5),
              Text("Seguidores", style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),),
              SizedBox(width: 5),
              Text("· $seguindo", style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
              SizedBox(width: 5),
              Text("Seguindo", style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),),
            ],
          ),
          SizedBox(height: 10),
          Text(bio, style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.school,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 5),
              Text("Téc. em $curso", style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),),
              SizedBox(width: 15),
              Icon(
                Icons.location_city,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 5),
              Text("Campus $campus", style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAbas(){
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
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold
              ),
              tabs: [
                Tab(text: "Posts"),
                Tab(text: "Comentários"),
                Tab(text: "Sobre"),
              ],
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
                          fontWeight: FontWeight.bold
                        ),
                        children: [
                          TextSpan(
                            text: "Você não tem\nnenhum post. ",
                          ),
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
                    child: Text("Você ainda não tem comentários. ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Center(
                    child: Text("Nada para ver aqui. :)",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
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

