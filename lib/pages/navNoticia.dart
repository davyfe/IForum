import 'package:flutter/material.dart';

class navNoticia extends StatefulWidget {
  const navNoticia({super.key});

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

          exibirConteudoNoticia(
            "ifnews",
            "Alaryce Jaylle",
            "27/04/2026",
            "https://img.freepik.com/fotos-gratis/professor-de-homem-usando-oculos-verificando-o-registro-de-classe-olhando-para-a-camera-intrigado-com-a-expressao-pensativa-pensando-sentado-na-mesa-da-escola-na-frente-do-quadro-negro-na-sala-de-aula_141793-131719.jpg",
            "A certificação de metodologias que nos auxiliam a lidar com o acompanhamento de consumo é uma das consequências das diversas transformações sociais e tecnológicas, refletindo a necessidade de práticas mais sustentáveis e conscientes no cotidiano.",
            "O uso de ferramentas digitais e estratégias organizadas permite uma análise mais precisa dos hábitos de consumo, possibilitando identificar padrões, desperdícios e oportunidades de melhoria. Além disso, essas metodologias contribuem para a formação de uma consciência crítica tanto em nível individual quanto coletivo, incentivando escolhas mais responsáveis e alinhadas com a preservação dos recursos naturais. Empresas, instituições e até mesmo consumidores passam a adotar práticas mais equilibradas, buscando reduzir impactos ambientais e promover um desenvolvimento mais sustentável. Dessa forma, a certificação dessas metodologias não apenas valida sua eficácia, mas também fortalece a importância de integrar tecnologia, inovação e responsabilidade social no dia a dia, acompanhando as demandas de uma sociedade cada vez mais preocupada com o futuro do planeta.",
            35,
          ),
        ],
      ),
    );
  }
  //definindo os parametros para criar as noticias
  Widget exibirConteudoNoticia(
      String autor,
      String nomePublicador,
      String data,
      String imagem,
      String titulo,
      String corpo,
      int totalComentarios,
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
        ),
        const SizedBox(height: 4),
        Text(
          "Publicado por $nomePublicador • $data",
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
          corpo,
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        const Divider(),
        Text("Comentários ($totalComentarios)", style: const TextStyle(fontWeight: FontWeight.bold)),
        _buildComentario("luiz.silva", "Que curioso! É importante questionar mais...", "40min"),
        _buildComentario("marinait", "@luiz.silva Achei interessante...", "2min", isReply: true),
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