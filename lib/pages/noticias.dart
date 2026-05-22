import 'package:flutter/material.dart';
import 'package:iforum/domain/PropriedadesNoticia.dart';
import 'package:iforum/pages/navNoticia.dart';
import 'package:iforum/cores.dart';
import 'package:float_column/float_column.dart';

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
      texto: "O Ministério da Magia tomou uma medida sem precedentes nesta manhã para garantir o rigor e o padrão de excelência na Escola de Magia e Bruxaria de Hogwarts. Através do Decreto Educacional Número 23, a atual professora de Defesa Contra as Artes das Trevas, Madame Dolores Jane Umbridge, foi oficialmente alçada ao posto de Alta Inquisidora. A decisão do Ministro Cornélio Fudge visa combater o que ele descreve como 'uma queda alarmante nos padrões de ensino' e supervisionar de perto as atitudes consideradas excêntricas do atual diretor, Alvo Dumbledore.\n\nCom seus novos poderes, a Alta Inquisidora já iniciou inspeções implacáveis em todas as disciplinas, causando visível desconforto entre o corpo docente. O Profeta Diário apurou que professores que não estiverem alinhados com as diretrizes aprovadas pelo Ministério poderão enfrentar sanções severas ou até mesmo a demissão imediata. Fontes internas confirmam que a medida também tem como objetivo suprimir boatos infundados e alarmistas espalhados por alguns alunos, em especial Harry Potter, sobre o suposto retorno d'Aquele-Que-Não-Deve-Ser-Nomeado — histórias que o Ministério tem classificado repetidamente como delírios perigosos e instigadores de pânico.\n\nAs reações no castelo são divididas. Enquanto famílias tradicionais enviaram corujas ao Ministério expressando alívio pela intervenção direta de Fudge na educação de seus filhos, parte dos estudantes relata um clima de extrema tensão e opressão nos corredores. Paredes de pedra estão sendo forradas com novos decretos de conduta, e qualquer atividade não curricular ou reunião de alunos agora exige aprovação expressa da nova Inquisidora. Resta saber se essa mão de ferro com luvas cor-de-rosa será suficiente para restaurar o prestígio de Hogwarts ou se apenas aprofundará as rachaduras políticas na comunidade bruxa.",
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
      titulo: "A percepção das dificuldades promove uma abordagem mais crítica e inclusiva na realidade educacional.",
      texto: "Os estudos mais recentes relacionados ao ambiente escolar demonstram que compreender as dificuldades enfrentadas pelos estudantes pode contribuir diretamente para a criação de estratégias mais eficientes de aprendizagem. A análise dessas experiências permite desenvolver soluções mais humanas e contextualizadas, levando em consideração fatores sociais, emocionais e culturais. Dessa forma, especialistas defendem que o fortalecimento de práticas colaborativas e inclusivas favorece não apenas o desempenho acadêmico, mas também a construção de uma comunidade escolar mais participativa e consciente.",
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
      texto: "A campanha de conscientização realizada no ambiente escolar buscou incentivar atitudes mais respeitosas e colaborativas entre os estudantes, reforçando a importância do diálogo e da convivência saudável no cotidiano acadêmico. Durante a ação, foram promovidas atividades educativas, rodas de conversa e apresentações temáticas voltadas ao fortalecimento da empatia e da participação coletiva. A iniciativa também destacou que o processo de aprendizagem vai além do conteúdo em sala de aula, envolvendo valores sociais fundamentais para a formação cidadã.",
      urlImagem: "https://internationalschool.global/wp-content/uploads/2025/08/shutterstock_2627251889.jpg",
      dataPub: "15/05/2026",
      tempo: "3d",
      autor: "Arnóbio B.",
      portal: "cipa.if",
      likes: 40,
      comentarios: 25,
    ),

    PropriedadesNoticia(
      titulo: "Grêmio Estudantil divulga ação sobre a importância da participação ativa e do engajamento dos alunos.",
      texto: "A ação promovida pelo Grêmio Estudantil teve como principal objetivo incentivar os alunos a participarem de maneira mais ativa das decisões e atividades relacionadas ao ambiente escolar. Representantes destacaram que o diálogo entre estudantes, professores e coordenação fortalece a construção de propostas mais democráticas e alinhadas às necessidades da comunidade acadêmica. Além disso, o movimento buscou reforçar valores como cooperação, respeito às diferenças e responsabilidade coletiva, considerados fundamentais para o desenvolvimento social e educacional dos jovens.",
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
      titulo: "Panorama sobre o universo dos jogos destaca seu papel no aprendizado e desenvolvimento dos estudantes.",
      texto: "Pesquisadores e educadores vêm discutindo cada vez mais a presença dos jogos digitais no cotidiano dos estudantes e seus possíveis impactos no desenvolvimento cognitivo e social. Segundo análises recentes, jogos podem estimular habilidades como raciocínio lógico, criatividade, trabalho em equipe e tomada de decisões rápidas. Além do entretenimento, diversas instituições passaram a utilizar elementos da gamificação em atividades pedagógicas, buscando tornar o aprendizado mais dinâmico, interativo e atrativo para os alunos.",
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
      texto: "O avanço das plataformas digitais transformou significativamente a maneira como os jovens consomem informação, interagem socialmente e constroem referências culturais dentro e fora da escola. Estudos recentes apontam que jogos, filmes e redes sociais exercem influência direta nos hábitos, na comunicação e até mesmo nos métodos de aprendizagem utilizados pelos estudantes. Especialistas afirmam que compreender essas mudanças é essencial para adaptar práticas educacionais às novas realidades tecnológicas, promovendo um ensino mais conectado ao cotidiano das novas gerações.",
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
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Cores.verdeifal,
            floating: true,
            snap: true,
            title: Text("Notícias",
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
              return buildNoticia(context: context, noticia: noticias[i]);
            },
          ),
        ],
      ),
    );
  }

  Widget buildNoticia({required BuildContext context, required PropriedadesNoticia noticia}){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NavNoticia(noticia: noticia)));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
                    SizedBox(width: 8),
                    Text(noticia.autor, style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 10),
                    Text(noticia.tempo),
                    Spacer(),
                    Icon(Icons.more_horiz),
                  ],
                ),
                SizedBox(height: 5),
                FloatColumn(
                  children: [
                    Floatable(
                      float: FCFloat.end, // Mantém a imagem na direita
                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          noticia.urlImagem,
                          width: 110,
                          height: 92,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    WrappableText(
                      text: TextSpan(
                        text: noticia.titulo,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
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
        SizedBox(width: 10),
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
        Spacer(),
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