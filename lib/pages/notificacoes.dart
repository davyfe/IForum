import 'package:flutter/material.dart';

class Notificacoes extends StatefulWidget{
  const Notificacoes({super.key});

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
            "Notificações",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildAbas(),
          buildNotificacoes(
              icone: Icons.newspaper,
              titulo: "Breaking News",
              mensagem: "...",
              horario: "7h",
              autor: "Sistema Ifal",
          )
        ],
      ),
    );
  }

  Widget _buildAbas(){
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              indicatorColor: Color(0xFF2E7D32),
              indicatorWeight: 3.0,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold
              ),
              tabs: [
                Tab(text: "Notificações"),
                Tab(text: "Bate-Papo"),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: Container(
              color: Colors.grey[250],
              child: TabBarView(
                children: [

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildNotificacoes({
    required IconData icone,
    required String titulo,
    required String mensagem,
    required String horario,
    required String autor,
  }){
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
      ),
      child: Column(
        children: [
          Row(
            children: [
                Icon(
                  icone,
                  color: Colors.black,
                  size: 20,
                ),
            ],
          )
        ],
      ),
    );
  }
}