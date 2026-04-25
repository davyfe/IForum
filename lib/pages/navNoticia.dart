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
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Notícias", style: TextStyle(color: Colors.white, fontSize: 14)),
      ),

      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.green[100],
                  child: Icon(Icons.person, size: 15, color: Colors.green[800])
              ),
              SizedBox(width: 8),
              Text('ifnews', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.check_circle, size: 14, color: Colors.blue),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'A certificação de metodologias que nos auxiliam a lidar com o acompanhamento de consumo é uma das consequências das diversas transformações sociais e tecnológicas, refletindo a necessidade de práticas mais sustentáveis e conscientes no cotidiano. Nesse cenário, o uso de ferramentas digitais e estratégias organizadas permite uma análise mais precisa dos hábitos de consumo, possibilitando identificar padrões, desperdícios e oportunidades de melhoria. Além disso, essas metodologias contribuem para a formação de uma consciência crítica tanto em nível individual quanto coletivo, incentivando escolhas mais responsáveis e alinhadas com a preservação dos recursos naturais. Empresas, instituições e até mesmo consumidores passam a adotar práticas mais equilibradas, buscando reduzir impactos ambientais e promover um desenvolvimento mais sustentável. Dessa forma, a certificação dessas metodologias não apenas valida sua eficácia, mas também fortalece a importância de integrar tecnologia, inovação e responsabilidade social no dia a dia, acompanhando as demandas de uma sociedade cada vez mais preocupada com o futuro do planeta.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network('https://img.freepik.com/fotos-gratis/professor-de-homem-usando-oculos-verificando-o-registro-de-classe-olhando-para-a-camera-intrigado-com-a-expressao-pensativa-pensando-sentado-na-mesa-da-escola-na-frente-do-quadro-negro-na-sala-de-aula_141793-131719.jpg'),
            ),
          ),

          Divider(),
          Text("Comentários (35)", style: TextStyle(fontWeight: FontWeight.bold)),
          _buildComentario("luiz.silva", "Que curioso! É importante questionar mais...", "40min"),
          _buildComentario("marinait", "Achei deveras interessante...", "2min", isReply: true),
        ],
      ),
    );
  }

  Widget _buildComentario(String user, String text, String time, {bool isReply = false}) {
    return Padding(
      padding: EdgeInsets.only(left: isReply ? 40: 0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 12,
                backgroundColor: Colors.green[100],
                child: Icon(Icons.person, size: 15, color: Colors.green[800]),),
              SizedBox(width: 8),
              Text(user, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(" - há $time", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(text),
          )
        ],
      ),
    );
  }
}