import 'package:flutter/material.dart';
import 'package:iforum/pages/noticiaClass.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});


  @override
  State<Noticias> createState() => _NoticiasState();
}


class _NoticiasState extends State<Noticias> {
  @override
  Widget build(BuildContext context) {


    //criar as noticias antes do listview
    var noticia1 = noticiaClass(
      usuario: "ifnews",
      tempo: "1d",
      titulo: "A certificação de metodologias que nos auxiliam a lidar com o acompanhamento de consumo é uma das consequências das diversas transformações sociais e tecnológicas, refletindo a necessidade de práticas mais sustentáveis e conscientes no cotidiano.",
      imagem: "https://img.freepik.com/fotos-gratis/professor-de-homem-usando-oculos-verificando-o-registro-de-classe-olhando-para-a-camera-intrigado-com-a-expressao-pensativa-pensando-sentado-na-mesa-da-escola-na-frente-do-quadro-negro-na-sala-de-aula_141793-131719.jpg",
      curtidas: 78,
      comentarios: 30,
    );


    var noticia2 = noticiaClass(
      usuario: "entreterimento_if",
      tempo: "1d",
      titulo: "Não obstante o consenso sobre a necessidade de qualificação, ainda não se demonstrou convincentemente que essa medida vá contribuir efetivamente para a mudança dos processos educacionais, exigindo, portanto, uma análise mais aprofundada e ações concretas que promovam resultados significativos.",
      imagem: "https://i.pinimg.com/736x/c2/1e/b0/c21eb09c967263b7d34e713da318f093.jpg",
      curtidas: 33,
      comentarios: 12,
    );


    var noticia3 = noticiaClass(
      usuario: "meio_ambiente.if",
      tempo: "2d",
      titulo: "As experiências acumuladas demonstram que a percepção das dificuldades afeta positivamente a correta previsão de alternativas às soluções ortodoxas, promovendo uma abordagem mais crítica, inclusiva e adaptada à realidade educacional.",
      imagem: "https://www.agricultura.sc.gov.br/wp-content/uploads/2024/06/WhatsApp-Image-2024-06-04-at-16.51.49.jpeg",
      curtidas: 55,
      comentarios: 35,
    );


    var noticia4 = noticiaClass(
      usuario: "cipa.if",
      tempo: "3d",
      titulo: "Foi publicado uma ação de conscientização sobre a importância da educação no ambiente escolar e a iniciativa destacou que aprender também envolve respeito, inclusão e o compromisso coletivo com a construção de um futuro melhor.",
      imagem: "https://internationalschool.global/wp-content/uploads/2025/08/shutterstock_2627251889.jpg",
      curtidas: 40,
      comentarios: 25,
    );


    var noticia5 = noticiaClass(
      usuario: "gremio.if",
      tempo: "3d",
      titulo: "O Grêmio Estudantil divulga ação de conscientização voltada à importância da participação ativa dos alunos no ambiente escolar, destacando o papel do diálogo, da inclusão e do engajamento coletivo na construção de uma comunidade educacional mais crítica e colaborativa",
      imagem: "https://observatorio.movimentopelabase.org.br/wp-content/uploads/2022/07/shutterstock-1937721487-970x570.jpg",
      curtidas: 45,
      comentarios: 20,
    );


    var noticia6 = noticiaClass(
      usuario: "jogos_oficial.if",
      tempo: "3d",
      titulo: "É publicado um panorama geral sobre o universo dos jogos, destacando sua evolução, os impactos no desenvolvimento cognitivo e social dos estudantes, além de seu papel como ferramenta de aprendizado, entretenimento e integração no ambiente educacional.",
      imagem: "https://cdn.focoradical.com.br/newfoco/banners/20251217173547IMG9373.jpg",
      curtidas: 80,
      comentarios: 50,
    );


    var noticia7 = noticiaClass(
      usuario: "entreterimento.if",
      tempo: "4d",
      titulo: "Pesquisas recentes no campo do entretenimento digital, destacam como jogos, filmes e redes sociais influenciam o comportamento dos jovens e contribuem para novas formas de aprendizado, interação e expressão cultural no ambiente escolar.",
      imagem: "https://midias-totvs.totvs.com/wp-content/uploads/2023/04/tecnologias-digitais.jpg",
      curtidas: 65,
      comentarios: 30,
    );

    return Scaffold(
      // Criar o topo da tela
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        leading: const Icon(Icons.arrow_back),
        title: const Text('Notícias', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),


      // Criando o conteúdo da tela com lista de rolagem
      body: ListView(
        children: [
          itemNoticia(noticia1),
          itemNoticia(noticia2),
          itemNoticia(noticia3),
          itemNoticia(noticia4),
          itemNoticia(noticia5),
          itemNoticia(noticia6),
          itemNoticia(noticia7),
        ],
      ),
    );
  }
  Widget itemNoticia(noticiaClass noticia) {
    return Padding(padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          //espaço entre topo e texto:
          SizedBox(height: 10),

          //criar linha com foto e verificação
          Row(
            children: [
              CircleAvatar(radius: 15,
                backgroundImage: NetworkImage(noticia.imagem),
              ),
              const SizedBox(width: 8),
              //nome em negrito
              Text(
                noticia.usuario,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              //selo de verificação
              const Icon(Icons.check_circle, size: 14, color: Colors.blue),
              const SizedBox(width: 4),
              Text(
                "- ${noticia.tempo}",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 10),

          //criar linha com texto e foto
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, //para alinhar o texto pelo topo
            children: [
              Expanded(
                child: Text(
                  noticia.titulo,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  maxLines: 4, //para limitar em 3 linhas
                  overflow: TextOverflow.ellipsis, //coloca "..." se for maior que 4 linhas
                ),
              ),

              const SizedBox(width: 10),
              //para a imagem da direita
              ClipRRect(
                borderRadius: BorderRadius.circular(8), //arredendo o canto da foto
                child: Image.network(
                  noticia.imagem,
                  width: 100,
                  height: 70,
                  fit: BoxFit.cover, //para a foto preeencher o quadradinho sem esticar
                ),
              ),
            ],
          ),


          //adicionar os icones
          const SizedBox(height: 8),


          //linha de curtir...
          Row(
            children: [
              //curtir
              Icon(Icons.thumb_up_alt_outlined, size: 18, color: Colors.grey[600]),
              const SizedBox(width: 5), //espaço entre curtir e numero
              Text(noticia.curtidas.toString(), style: TextStyle(color: Colors.grey[600])),


              //comentar
              const SizedBox(width: 20), //espaço entre os icones
              Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey[600]),
              const SizedBox(width: 5),
              Text(noticia.comentarios.toString(), style: TextStyle(color: Colors.grey[600])),


              const Spacer(), //empurrar o proximo icone para o final da linha
              //compartilhar
              Icon(Icons.share_outlined, size: 18, color: Colors.grey[600]),
            ],
          ),
        ],
      ),
    );
  }
}

