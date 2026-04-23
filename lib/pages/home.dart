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
        // se tratando o pesquisar:
        title: Padding ( // adicionei o padding pra diminuir a largura
          padding: EdgeInsets.symmetric(horizontal:18),
          child: SizedBox(
            height: 35,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isDense: true, // pra controlar o espaço sem mexer no texto
                hintText: "Pesquisar",
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white.withValues(alpha: 0.9),
                filled: true,
                contentPadding: EdgeInsets.only(right: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
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
            comunidade: "",
            tempo: "1d",
            tipo: "Material",
            texto: "",
            likes: "78",
            comentarios: "30",
            anexo: true,
          ),
          buildPost(
            titulo: "O que é DNA?",
            autor: "pdrolopes",
            comunidade: "biologia_ifal",
            tempo: "há 30 min",
            tipo: "Dúvida",
            texto: "",
            likes: "22",
            comentarios: "3",
            anexo: false
          ),
          buildPost(
            titulo: "Meu Primeiro Post Aqui!!!",
            autor: "sabynnalouyse",
            comunidade: "",
            tempo: "há 12 min",
            tipo: "Bate Papo",
            texto: "Caros amigos, a constante divulgação das informações maximiza as possibilidades por conta das condições financeiras e administrativas exigidas. Por outro lado, a necessidade de renovação processual maximiza as possibilidades por conta do sistema de participação geral.",
            likes: "9",
            comentarios: "0",
            anexo: false,
          ),
          buildPost(
            titulo: "O meu emulador do android studio não tá funcionandooooo",
            autor: "duartege",
            comunidade: "devs.if",
            tempo: "há 1 hora",
            tipo: "Ajuda",
            texto: "",
            likes: "38",
            comentarios: "12",
            anexo: false
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
  Widget buildNoticias(){
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
              _cardNoticias("Professor cria projeto que leva educação ambiental à comunidades carentes.", Color(0xFF4549FF), "https://media.istockphoto.com/id/1457744422/pt/foto/teacher-in-classroom-points-to-student-raising-hand.jpg?s=612x612&w=0&k=20&c=9w0pPd1CJF6JyYWsOtLC5Y4PYyZgGgfGdqsM8nRJcSg="),
              _cardNoticias("São lançados os editais de auxílio estudantil para alunos baixa renda.", Colors.redAccent, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCzy4jkGDPi9dsoQ6sgXAjQY94KrrInvapRA&s"),
              _cardNoticias("Meio Ambiente: Novo núcleo promete mudar a gestão ambiental do campus.", Colors.cyan, "https://static.todamateria.com.br/upload/ma/os/maosplantandoarvorespelosobjetivosdedesenvolvimentosustentaveldomeioambiente-cke.jpg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cardNoticias(String texto, Color cor, String url){
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
      child: Text(texto,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  // posts
  Widget buildPost({
    required String titulo,
    required String autor,
    required String comunidade,
    required String tempo,
    required String tipo,
    required String texto,
    required String likes,
    required String comentarios,
    required bool anexo,
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
              CircleAvatar(radius: 12, backgroundColor: Color(0xFF8C9EFF)), // avatar
              SizedBox(width: 8),
              Text(autor, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Icon(Icons.check_circle, size: 14, color: Colors.blue), // verificado
              SizedBox(width: 5),
              if(comunidade.isNotEmpty)...[
                Icon(Icons.chevron_right, size: 12),
                SizedBox(width: 5),
                Text(comunidade, style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(width: 5),
              ],
              Text("•", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              SizedBox(width: 5),
              Text(tempo, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
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
              if(tipo=="Material") _buildTag(tipo, Colors.indigo),
              if(tipo=="Dúvida") _buildTag(tipo, Colors.red),
              if(tipo=="Bate Papo") _buildTag(tipo, Colors.green),
              if(tipo=="Ajuda") _buildTag(tipo, Colors.yellow.shade700),

              SizedBox(width: 8),
              if(tipo=='Material') _buildTag("Literatura", Colors.orange),
            ],
          ),
          SizedBox(height:12),

          if(texto.isNotEmpty)...[
            Text(
              texto,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height:12),
          ],

          // caso tenha anexo
          if(anexo)...[
            _buildAnexo(),
            SizedBox(height: 12),
          ],

          // interação
          Row(
            children: [
              _buildInteractionLikes(likes), // like
              SizedBox(width: 10),
              _buildInteractionComent(comentarios), // comentario
              Spacer(),
              _buildInteractionCompt() // compartilhar
            ],
          )
        ],
      ),
    );
  }

  // tags
  Widget _buildTag(String texto, Color cor){
    return Container(
        padding: EdgeInsets.only(left: 0, right: 8, top: 2, bottom: 2),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(radius: 8, backgroundColor: cor),
            SizedBox(width: 4),
            Text(texto, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        )
    );
  }

  // anexo (dados fixos, por enquanto)
  Widget _buildAnexo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.picture_as_pdf,
            color: Colors.redAccent,
            size: 28,
          ),
          SizedBox(width: 8),

          Text(
            "livro.pdf",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),

          Icon(Icons.file_download_outlined, size: 18),
        ],
      ),
    );
  }

  // botoes de interação
  Widget _buildInteractionLikes(String label){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.thumb_up_alt_outlined, size:16, color: Colors.grey[700]),
            SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 12)),
            SizedBox(width: 4),
            Text("|", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            SizedBox(width: 4),
            Icon(Icons.thumb_down_alt_outlined, size:16, color: Colors.grey[700])
          ],
        )
    );
  }

  Widget _buildInteractionComent(String label){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.chat_bubble_outline_outlined, size:16, color: Colors.grey[700]),
            SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 12))
          ],
        )
    );
  }

  Widget _buildInteractionCompt(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.share_outlined, size:16, color: Colors.grey[700])
          ],
        )
    );
  }

}