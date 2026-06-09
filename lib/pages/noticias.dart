import 'package:flutter/material.dart';
import 'package:iforum/domain/PropriedadeNoticia.dart';
import 'package:iforum/pages/navNoticia.dart';
import 'package:iforum/cores.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {

  List noticias = [
    PropriedadesNoticia(
      titulo: "Professor inova com novo método apresentado em sala.",
      texto: "O uso de ferramentas digitais e estratégias organizadas permite uma análise mais precisa dos hábitos de consumo, possibilitando identificar padrões, desperdícios e oportunidades de melhoria. Além disso, essas metodologias contribuem para a formação de uma consciência crítica tanto em nível individual quanto coletivo, incentivando escolhas mais responsáveis e alinhadas com a preservação dos recursos naturais.",
      urlImagem: "https://img.freepik.com/fotos-gratis/professor-de-homem-usando-oculos-verificando-o-registro-de-classe-olhando-para-a-camera-intrigado-com-a-expressao-pensativa-pensando-sentado-na-mesa-da-escola-na-frente-do-quadro-negro-na-sala-aula_141793-131719.jpg",
      dataPub: "18/05/2026",
      tempo: "1d",
      autor: "Alaryce Jaylle",
      portal: "Ifal Notícias",
      likes: 150,
      comentarios: 5,
      tema: Colors.indigo,
    ),

    PropriedadesNoticia(
      titulo: "Ordem e Disciplina: Dolores Umbridge é nomeada a primeira Alta Inquisidora de Hogwarts.",
      texto: "O Ministério da Magia tomou uma medida sem precedentes nesta manhã para garantir o rigor e o padrão de excellence na Escola de Magia e Bruxaria de Hogwarts... (texto omitido para reduzir tamanho)",
      urlImagem: "https://observatoriodocinema.com.br/wp-content/uploads/2023/12/dolores-umbridge-harry-potter-scaled.jpg",
      dataPub: "08/09/1995",
      tempo: "3h",
      autor: "Rita Skeeter",
      portal: "O Profeta Diário",
      likes: 85,
      comentarios: 12,
      tema: Colors.pink.shade300,
    ),

    PropriedadesNoticia(
      titulo: "Grêmio Estudantil divulga action sobre a importância da participação ativa e do engajamento dos alunos.",
      texto: "A ação promovida pelo Grêmio Estudantil teve como principal objetivo incentivar os alunos...",
      urlImagem: "https://observatorio.movimentopelabase.org.br/wp-content/uploads/2022/07/shutterstock-1937721487-970x570.jpg",
      dataPub: "15/05/2026",
      tempo: "3d",
      autor: "José Paulo",
      portal: "gremio.if",
      likes: 45,
      comentarios: 20,
      tema: Color(0xFF9C2F27),
    ),

    PropriedadesNoticia(
      titulo: "A percepção das dificuldades promove uma abordagem mais crítica e inclusiva na realidade educacional.",
      texto: "Os estudos mais recentes relacionados ao ambiente escolar demonstram que compreender as dificuldades enfrentadas pelos estudantes...",
      urlImagem: "https://www.agricultura.sc.gov.br/wp-content/uploads/2024/06/WhatsApp-Image-2024-06-04-at-16.51.49.jpeg",
      dataPub: "16/05/2026",
      tempo: "2d",
      autor: "Adriana Santana",
      portal: "meio_ambiente_if",
      likes: 55,
      comentarios: 35,
    ),

    PropriedadesNoticia(
      titulo: "Ação de conscientização destaca que aprender envolve respeito, inclusão e compromisso coletivo.",
      texto: "A campanha de conscientização realizada no ambiente escolar buscou incentivar atitudes mais respeitosas...",
      urlImagem: "https://internationalschool.global/wp-content/uploads/2025/08/shutterstock_2627251889.jpg",
      dataPub: "15/05/2026",
      tempo: "3d",
      autor: "Arnóbio B.",
      portal: "cipa.if",
      likes: 40,
      comentarios: 25,
    ),

    PropriedadesNoticia(
      titulo: "Panorama sobre o universo dos jogos destaca seu papel no aprendizado e desenvolvimento dos estudantes.",
      texto: "Pesquisadores e educadores vêm discutindo cada vez mais a presença dos jogos digitais...",
      urlImagem: "https://cdn.focoradical.com.br/newfoco/banners/20251217173547IMG9373.jpg",
      dataPub: "15/05/2026",
      tempo: "3d",
      autor: "Karinne Coelho",
      portal: "jogos_if",
      likes: 80,
      comentarios: 50,
      tema: Color(0xFF1F9A25),
    ),

    PropriedadesNoticia(
      titulo: "Pesquisas apontam como o entretenimento digital influencia o comportamento e aprendizado dos jovens.",
      texto: "O avanço das plataformas digitais transformou significativamente a maneira como os jovens consomem informação...",
      urlImagem: "https://midias-totvs.totvs.com/wp-content/uploads/2023/04/tecnologias-digitais.jpg",
      dataPub: "14/05/2026",
      tempo: "4d",
      autor: "Cledja R.",
      portal: "pesquisas.if",
      likes: 65,
      comentarios: 30,
      tema: Color(0xFF316479),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: const Text("Notícias"),
            actions: [
              IconButton(
                icon: const Icon(Icons.search_outlined), onPressed: () {},),
            ],
          ),
          SliverList.builder(
            itemCount: noticias.length,
            itemBuilder: (context, i) {
              return buildNoticia(context: context, noticia: noticias[i]);
            },
          ),
        ],
      ),
    );
  }

  Widget buildNoticia(
      {required BuildContext context, required PropriedadesNoticia noticia}) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NavNoticia(noticia: noticia)));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 15, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
                    const SizedBox(width: 8),
                    Text(noticia.autor,
                      style: const TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(width: 10),
                    Text(noticia.tempo),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
                const SizedBox(height: 5),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        noticia.titulo,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        noticia.urlImagem,
                        width: 120,
                        height: 102,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                buildInteracao(noticia.likes, noticia.comentarios),
              ],
            ),
          ),
          const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        ],
      ),
    );
  }

  Widget buildInteracao(int likes, int comentarios) {
    return Row(
      children: [
        Chip(
          backgroundColor: Cores.fundo,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.thumb_up_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text('$likes |'),
              const SizedBox(width: 8),
              const Icon(
                Icons.thumb_down_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
            ],
          ),
          labelPadding: const EdgeInsets.only(left: 4, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        const SizedBox(width: 10),
        Chip(
          backgroundColor: Cores.fundo,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text('$comentarios'),
            ],
          ),
          labelPadding: const EdgeInsets.only(left: 4, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        const Spacer(),
        Chip(
          backgroundColor: Cores.fundo,
          label: const Icon(
            Icons.share_outlined,
            size: 16,
            color: Colors.black54,
          ),
          labelPadding: const EdgeInsets.only(left: 2, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ],
    );
  }
}