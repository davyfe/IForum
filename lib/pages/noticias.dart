import 'package:flutter/material.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: Icon(Icons.arrow_back),
          title: Text('Notícias'),
          centerTitle: true,        ),
        body: ListView(
          children: [
            itemNoticia(),
            itemNoticia(),
            itemNoticia(),
            itemNoticia(),
            itemNoticia(),
          ],
        )
    );
  }

  Widget itemNoticia() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ifnews - 1d',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('A certificação de metodologias que nos auxiliam a lidar com o acompanhamento das preferências de consumo é uma das consequências das diversa...'),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 16),
                    SizedBox(width: 5),
                    Text('58'),
                    SizedBox(width: 15),
                    Icon(Icons.comment, size: 16),
                    SizedBox(width: 5),
                    Text('40'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
