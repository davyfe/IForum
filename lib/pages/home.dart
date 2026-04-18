import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iforum/pages/criarPost.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Pesquisar",
            prefixIcon: Icon(Icons.search),
            fillColor: Colors.white.withValues(alpha: 0.9),
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),

      body: ListView(
        children: [
          buildNoticias(), // noticias
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 0, top: 16),
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
            likes: "78",
            comentarios: "30",
          ),
          buildPost(
            titulo: "O que é DNA?",
            autor: "pdrolopes",
            tempo: "há 30 minutos",
            tipo: "Dúvida",
            likes: "22",
            comentarios: "3",
          ),
          buildPost(
            titulo: "Meu Primeiro Post Aqui!!!",
            autor: "sabynnalouyse",
            tempo: "há 12 minutos",
            tipo: "Bate Papo",
            likes: "9",
            comentarios: "0",
          ),
          buildPost(
            titulo: "O meu emulador do android studio não tá funcionandooooo",
            autor: "duartege",
            tempo: "há 1 hora",
            tipo: "Ajuda",
            likes: "38",
            comentarios: "12",
          ),
        ],
      ),

      // botao flutuante
      floatingActionButton: FloatingActionButton(
        // isso aqui é quando clicar no botão verde "+"...
        onPressed: (){
          // 1. Navigator: É a classe responsável por gerenciar a "pilha" de telas do app.
          // 2. .push: É o método que coloca uma nova tela no topo dessa pilha (fazendo-a aparecer).
          Navigator.push(
            // context: É o "endereço" de onde você está agora. (no caso, a tela Home())
             context,
            // MaterialPageRoute: É um "pacote" que o Flutter usa para criar a transição.
            // Ele define as animações automáticas (ex: no Android a tela sobe, no iOS ela desliza).
            // Ele também cria o vínculo que permite que o botão "voltar" funcione sozinho.
            MaterialPageRoute(
              // builder: É uma função construtora.
              // Ela diz ao Flutter: "Ei, quando chegar a hora de mostrar a tela, use este desenho aqui".
              builder: (context) {
                // Retorna a classe da sua nova tela que você criou em outro arquivo.
                // O 'const' ajuda na performance, avisando que essa tela não muda sua estrutura básica.
                return const CriarPost();
              },
            ),
          );
        },
        backgroundColor: Color(0xFF4CAF50),
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 35, color: Colors.white),
      ),
    );
  }

  // noticias
  buildNoticias(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 10, top: 16),
          child: Text("Notícias da Semana", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              _cardNoticias("PESQUISA: Professor desen...", Color(0xFF4549FF), "https://media.istockphoto.com/id/1457744422/pt/foto/teacher-in-classroom-points-to-student-raising-hand.jpg?s=612x612&w=0&k=20&c=9w0pPd1CJF6JyYWsOtLC5Y4PYyZgGgfGdqsM8nRJcSg="),
              _cardNoticias("Assistência: São lançados os editais de...", Colors.redAccent, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCzy4jkGDPi9dsoQ6sgXAjQY94KrrInvapRA&s"),
              _cardNoticias("Meio Ambiente: Novo núcleo pr...", Colors.cyan, "https://static.todamateria.com.br/upload/ma/os/maosplantandoarvorespelosobjetivosdedesenvolvimentosustentaveldomeioambiente-cke.jpg"),
            ],
          ),
        ),
      ],
    );
  }

  _cardNoticias(String texto, Color cor, String url){
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(8),
      child: Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
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
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 12, backgroundColor: Colors.grey), // avatar
              SizedBox(width: 8),
              Text(autor, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Icon(Icons.check_circle, size: 14, color: Colors.blue), // verificado
              SizedBox(width: 5),
              Text("• $tempo", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
          SizedBox(height: 12),

          // titulo
          Text(
            titulo,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),

          // tags
          Row(
            children: [
              if(tipo=="Material") _buildTag(tipo, Colors.blue),
              if(tipo=="Dúvida") _buildTag(tipo, Colors.greenAccent),
              if(tipo=="Bate Papo") _buildTag(tipo, Colors.deepPurple),
              if(tipo=="Ajuda") _buildTag(tipo, Colors.red),

              SizedBox(width: 8),
              if(tipo=='Material') _buildTag("Literatura", Colors.orange),
            ],
          ),
          SizedBox(height:12),

          // interação
          Row(
            children: [
              _buildInteractionB(Icons.thumb_up_off_alt, likes), // like
              SizedBox(width: 10),
              _buildInteractionB(Icons.chat_bubble_outline, comentarios), // comentario
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

}