import 'dart:ui';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Color(0xFF2E7D32)), // appbar
      body: ListView(
        children: [
          buildHeader(), // appbar modificado
          buildNoticias(), // noticias
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text("Posts Recentes", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            )),
          ),
          buildPost(
            titulo: "PDF: Livro xxx",
            autor: "davyf",
            tempo: "1d",
            tipo: "Material",
          ),
          buildPost(
            titulo: "O que é DNA?",
            autor: "pdrolopes",
            tempo: "há 30 minutos",
            tipo: "Dúvida",
          ),
          buildPost(
            titulo: "Meu Primeiro Post Aqui!!!",
            autor: "sabynnalouyse",
            tempo: "há 12 minutos",
            tipo: "Bate Papo",
          ),
          buildPost(
            titulo: "O meu emulador do android studio não tá funcionandooooo",
            autor: "duartege",
            tempo: "há 1 hora",
            tipo: "Ajuda",
          ),
        ],
      ),

      // botao flutuante
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: const Color(0xFF4CAF50),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 35, color: Colors.white),
      ),

      // menu em baixo
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""), // home
          BottomNavigationBarItem(icon: Icon(Icons.article), label: ""), // noticias
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: ""), // comunidades
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""), // notificações
          BottomNavigationBarItem(icon: CircleAvatar(radius: 12), label: ""), // perfil
        ],
      ),
    );
  }
}

  // noticias
  buildNoticias(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Notícias da Semana", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _cardNoticias("PESQUISA: Professor desen...", Color(0xFF4549FF), ),
              _cardNoticias("Assistência: São lançados...", Colors.redAccent),
              _cardNoticias("Meio Ambiente...", Colors.cyan),
            ],
          ),
        ),
      ],
    );
  }

_cardNoticias(String texto, Color cor){
  return Container(
    width: 200,
    margin: const EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.circular(12),
      image: const DecorationImage(
        image: NetworkImage("https://via.placeholder.com/200x150"),
        fit: BoxFit.cover,
      ),
    ),
    alignment: Alignment.bottomLeft,
    padding: const EdgeInsets.all(8),
    child: Text(texto, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
  );
}

  // posts
  buildPost({
    required String titulo,
    required String autor,
    required String tempo,
    required String tipo,
    required String likes,
    required String comentarios,
  }){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 15, backgroundColor: Colors.grey), // avatar
              const SizedBox(width: 8),
              Text(autor, style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              Icon(Icons.check_circle, size: 14, color: Colors.blue), // verificado
              const SizedBox(width: 5),
              Text("• $tempo", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
          const SizedBox(height: 12),

        /// titulo
        Text(
          titulo,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // tags
        Row(
          children: [
            if(tipo=="Material") _buildTag(tipo, Colors.blue),
            if(tipo=="Dúvida") _buildTag(tipo, Colors.greenAccent),
            if(tipo=="Bate Papo") _buildTag(tipo, Colors.deepPurple),
            if(tipo=="Ajuda") _buildTag(tipo, Colors.red),

            const SizedBox(width: 8),
            if(tipo=='Material') _buildTag("Literatura", Colors.orange),
          ],
        ),
        const SizedBox(height:12),

        // interação
        Row(
          children: [
            _buildInteractionB(Icons.thumb_up_off_alt, "78"), // like
            const SizedBox(width: 10),
            _buildInteractionB(Icons.chat_bubble_outline, "30"), // comentario
            Spacer(),
            _buildInteractionC(Icons.reply) // compartilhar
          ],
        )
      ],
    ),
  );
}

// tags
Widget _buildTag(String texto, Color cor){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: cor.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: cor),
        SizedBox(width: 4),
        Text(texto, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    )
  );
}

// botoes de interação
Widget _buildInteractionB(IconData icon, String label){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Icon(icon, size:16, color: Colors.grey[700]),
        SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    )
  );
}

// botao de compartilhar
Widget _buildInteractionC(IconData icon){
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(icon, size:16, color: Colors.grey[700]),
          SizedBox(width: 4),
        ],
      )
  );
}
