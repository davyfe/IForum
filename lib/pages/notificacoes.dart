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
      body: _buildAbas()
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
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
              ),
              tabs: [
                Tab(text: "Caixa de entrada"),
                Tab(text: "Bate-Papo"),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      buildNotificacoes(
                        icone: Icons.campaign,
                        titulo: "Breaking News",
                        mensagem: "Pensando mais a longo prazo, o entendimento das metas"
                            "propostas desafia a capacidade de legalização das condições"
                            "financeiras e administrativas do setor agrícola.",
                        horario: "7h",
                        autor: "Sistema Ifal",
                      ),
                      buildNotificacoes(
                        icone: Icons.coffee,
                        titulo: "Alguém sabe como alinhar isso ao centro?",
                        mensagem: "Estou desenvolvendo uma tela em java, porém tô há"
                            "umas 3 horas tentando alinhas isso ao centro e NÃO consigo"
                            "de jeito nenhum, nem o chatGPT conseguiu ",
                        horario: "1 dia",
                        autor: "Desenvolvedores.ifal",
                      ),
                      ],
                    ),
                      const Center(
                        child: Text("Você ainda não tem conversas.",
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
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.grey,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
                Icon(
                  icone,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(width: 15),
                Text(
                  titulo,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            mensagem,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                horario,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "· $autor",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}