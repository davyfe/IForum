import 'package:flutter/material.dart';

//definir quais dados a tela precisa receber e depende da tela anterior com as informações
class navNoticia extends StatefulWidget {
  final String autor;
  final String nome;
  final String data;
  final String imagem;
  final String titulo;
  final String texto;
  final int comentarios;

  const navNoticia({
    super.key,
    required this.autor,
    required this.nome,
    required this.data,
    required this.imagem,
    required this.titulo,
    required this.texto,
    required this.comentarios,
  });

  @override
  State<navNoticia> createState() => _navNoticiaState();
}

class _navNoticiaState extends State<navNoticia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Notícias", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [

          //parametros vazios a serem preenchidos com as informações
          exibirConteudo(
            widget.autor,
            widget.nome,
            widget.data,
            widget.imagem,
            widget.titulo,
            widget.texto,
            widget.comentarios,
          ),
        ],
      ),
    );
  }
  //acessar as variaveis definidas no topo da classe
  Widget exibirConteudo(
      String autor,
      String nome,
      String data,
      String imagem,
      String titulo,
      String texto,
      int comentarios,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
                radius: 15,
                backgroundColor: Colors.green[100],
                child: Icon(Icons.person, size: 15, color: Colors.green[800])),
            const SizedBox(width: 8),
            Text(autor, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Icon(Icons.check_circle, size: 14, color: Colors.blue),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          titulo,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 4),
        Text(
          "Publicado por $nome • $data",
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imagem),
          ),
        ),
        Text(
          texto,
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        const Divider(),
        Text("Comentários ($comentarios)", style: const TextStyle(fontWeight: FontWeight.bold)),

        // comentarios pra cada noticia
        if (autor == "entreterimento_if") ...[
          _buildComentario("raissa.almeida", "Eu concordo.", "10min"),
          _buildComentario("eduarda.souza", "É importante discutir isso...", "5min"),
        ] else ...[
          _buildComentario("luiz.silva", "Que curioso! É importante questionar mais...", "40min"),
          _buildComentario("marinait", "@luiz.silva Achei interessante...", "2min", isReply: true),
        ],

        const SizedBox(height: 12),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Mostrar mais comentários", style: TextStyle(color: Colors.blue)),
              Icon(Icons.keyboard_arrow_down, color: Colors.blue),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComentario(String user, String text, String time, {bool isReply = false}) {
    return Padding(
      padding: EdgeInsets.only(left: isReply ? 40 : 0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green[100],
                child: Icon(Icons.person, size: 15, color: Colors.green[800]),
              ),
              const SizedBox(width: 8),
              Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(" - há $time", style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(text),
          )
        ],
      ),
    );
  }
}