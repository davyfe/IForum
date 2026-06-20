import 'package:flutter/material.dart';
import 'package:iforum/domain/PropriedadeNoticia.dart';
import 'package:iforum/pages/navNoticia.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/widget/buildNoticia.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {

  List noticias = [
    PropriedadesNoticia(
      id: 1,
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
      id: 1,
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
      id: 2,
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
      id: 2,
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
      id: 3,
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
      id: 4,
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
      id: 5,
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
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Cores.verdeifal,
            floating: true,
            snap: true,
            title: const Text("Notícias",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20,),
            ),
            centerTitle: true,
            actions: [
              IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {},),
            ],
          ),
          SliverList.builder(
            itemCount: noticias.length,
            itemBuilder: (context, i) {
              return BuildNoticia(noticia: noticias[i]);            },
          ),
        ],
      ),
    );
  }
}