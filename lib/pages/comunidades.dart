import 'dart:ui';
import 'package:flutter/material.dart';

class Comunidades extends StatefulWidget{
  const Comunidades({super.key});

  @override
  State<Comunidades> createState() => _ComunidadesState();
}

class _ComunidadesState extends State<Comunidades>{
  @override
  Widget build(BuildContext context) {
    final recomendados = [
      {"nome": "dit.ifal", "participantes": "250 participantes", "descricao": "Esta é a comunidade do Núcleo de Desenvolvimento e Inovação Tecnológica do Ifal Campus Arapiraca, ou só DIT :)"},
      {"nome": "volei.if", "participantes": "125 participantes", "descricao": "Comunidade de Vôlei do Ifal Arapiraca!"},
      {"nome": "desenhifal", "participantes": "56 participantes", "descricao": "Aprimore suas hbilidades e compartilhe sua arte com uma comunidade de mentes criativas."},
      {"nome": "jifal", "participantes": "565 participantes", "descricao": "Atualizações sobre o JIFAl\n#JIFAL26"},
    ];

    final criativo = [
      {"nome": "devs.if", "participantes": "580 participantes", "descricao": "Espaço dedicado para quem ama código! Aqui compartilhamos projetos de Python e Flutter."},
      {"nome": "literifal", "participantes": "245 participantes", "descricao": "Clube de leitura e escrita criativa. Debatemos clássicos da literatura e organizamos o sarau."},
      {"nome": "cine.if", "participantes": "112 participantes", "descricao": "Para os amantes da sétima arte. Assistimos filmes e documentários todas as sextas-feiras."},
      {"nome": "roboti.if", "participantes": "89 participantes", "descricao": "Grupo focado em robótica competitiva e automação. Se você gosta de Arduino, este é o lugar!"},
    ];

    final cursos = [
      {"nome": "info.ifal", "participantes": "450 participantes", "descricao": "Focado em desenvolvimento de sistemas, web e mobile. Discutimos algoritmos e TI."},
      {"nome": "eletro.ifal", "participantes": "320 participantes", "descricao": "Tudo sobre circuitos elétricos, automação industrial e manutenção elétrica."},
      {"nome": "renovaveis.if", "participantes": "180 participantes", "descricao": "Especializado em energia solar, eólica e tecnologias de geração limpa."},
      {"nome": "quimica.if", "participantes": "210 participantes", "descricao": "Voltada para análises laboratoriais, processos industriais e química orgânica."},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        title: Text("Comunidades", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: (){},
          )
        ],
      ),
      body: ListView(
        children: [
          buildConvite(categoria: "Recomendado para Você", dados: recomendados),
          buildConvite(categoria: "Criatividade", dados: criativo),
          buildConvite(categoria: "Cursos", dados: cursos)
        ],
      ),
    );
  }

  buildConvite({
    required String categoria,
    required List<Map<String, String>> dados
}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 10, top: 16),
          child: Text(categoria, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 226,
            child: Wrap(
              direction: Axis.vertical,
              spacing: 10,
              runSpacing: 0,
              children: dados.map<Widget>((item) {
                return _cardConvite(
                  item['nome']!,
                  item['participantes']!,
                  item['descricao']!,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  _cardConvite(String nome, String participantes, String descricao){
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 16, backgroundColor: Colors.grey),
              SizedBox(width: 8),
              // pro nome e 'participantes' ficar alinhado como no
              // design do canva, fiz:
              Expanded( // assim consigo colocar um child
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(nome, style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                        Icon(Icons.check_circle, size: 14, color: Colors.blue)
                      ],
                    ),
                    Text(
                      participantes,
                      style: TextStyle(color: Colors.grey[700], fontSize: 10),
                    ),
                  ],
                ),
              ),

              // o botao de entrar
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CAF50),
                  shape: StadiumBorder(),
                  elevation: 0,
                  minimumSize: Size(60, 25),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0)
                ),
                child: Text("Entrar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            descricao,
            // para limitar o tamanho:
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // adiciona "..."
          ),
        ],
      ),
    );
  }
}