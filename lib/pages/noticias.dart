import 'package:flutter/material.dart';
import 'package:iforum/pages/navNoticia.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  @override

  //cabeçalho e lista de notícias com rolagem
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          //clique
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notícias', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: [

          //recebe dados para evitar a repetição do código
          itemNoticia(
            "ifnews",
            "1d",
            "A certificação de metodologias que nos auxiliam a lidar com o acompanhamento de consumo é uma das consequências das diversas transformações sociais e tecnológicas, refletindo a necessidade de práticas mais sustentáveis e conscientes no cotidiano.",
            "https://img.freepik.com/fotos-gratis/professor-de-homem-usando-oculos-verificando-o-registro-de-classe-olhando-para-a-camera-intrigado-com-a-expressao-pensativa-pensando-sentado-na-mesa-da-escola-na-frente-do-quadro-negro-na-sala-aula_141793-131719.jpg",
            78,
            30,

                //para abrir a tela com as informações da notícia
                () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => navNoticia(
                autor: "ifnews",
                nome: "Alaryce Jaylle",
                data: "27/04/2026",
                imagem: "https://img.freepik.com/fotos-gratis/professor-de-homem-usando-oculos-verificando-o-registro-de-classe-olhando-para-a-camera-intrigado-com-a-expressao-pensativa-pensando-sentado-na-mesa-da-escola-na-frente-do-quadro-negro-na-sala-de-aula_141793-131719.jpg",
                titulo: "A certificação de metodologias que nos auxiliam a lidar com o acompanhamento de consumo é uma das consequências das diversas transformações sociais e tecnológicas, refletindo a necessidade de práticas mais sustentáveis e conscientes no cotidiano.",
                texto: "O uso de ferramentas digitais e estratégias organizadas permite uma análise mais precisa dos hábitos de consumo, possibilitando identificar padrões, desperdícios e oportunidades de melhoria. Além disso, essas metodologias contribuem para a formação de uma consciência crítica tanto em nível individual quanto coletivo, incentivando escolhas mais responsáveis e alinhadas com a preservação dos recursos naturais.",
                comentarios: 35,
              )));
            },
          ),

          itemNoticia(
            "entreterimento_if",
            "1d",
            "Não obstante o consenso sobre a necessidade de qualificação, ainda não se demonstrou convincentemente que essa medida vá contribuir efetivamente para a mudança dos processos educacionais, exigindo, portanto, uma análise mais aprofundada e ações concretas que promovam resultados significativos.",
            "https://i.pinimg.com/736x/c2/1e/b0/c21eb09c967263b7d34e713da318f093.jpg",
            33,
            12,
                () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => navNoticia(
                autor: "entreterimento_if",
                nome: "Alaryce Jaylle",
                data: "1d",
                imagem: "https://i.pinimg.com/736x/c2/1e/b0/c21eb09c967263b7d34e713da318f093.jpg",
                titulo: "Não obstante o consenso sobre a necessidade de qualificação, ainda não se demonstrou convincentemente que essa medida vá contribuir efetivamente para a mudança dos processos educacionais, exigindo, portanto, uma análise mais aprofundada e ações concretas que promovam resultados significativos.",
                texto: "A necessidade de qualificação na educação é amplamente reconhecida, mas ainda há dúvidas sobre sua real eficácia na transformação dos processos educacionais. Especialistas apontam que, isoladamente, essa medida tende a ter impacto limitado, já que outros fatores, como infraestrutura, desigualdades sociais e políticas públicas, também influenciam diretamente a qualidade do ensino.",
                comentarios: 12,
              )));
            },
          ),

          itemNoticia(
              "meio_ambiente.if",
              "2d",
              "As experiências acumuladas demonstram que a percepção das dificuldades afeta positivamente a correta previsão de alternativas às soluções ortodoxas, promovendo uma abordagem mais crítica, inclusiva e adaptada à realidade educacional.",
              "https://www.agricultura.sc.gov.br/wp-content/uploads/2024/06/WhatsApp-Image-2024-06-04-at-16.51.49.jpeg",
              55,
              35,
              //como não há informações para essa tela, usa-se "null" pq ela n abrirá
              null),

          itemNoticia(
              "cipa.if",
              "3d",
              "Foi publicado uma ação de conscientização sobre a importância da educação no ambiente escolar e a iniciativa destacou que aprender também envolve respeito, inclusão e o compromisso coletivo com a construção de um futuro melhor.",
              "https://internationalschool.global/wp-content/uploads/2025/08/shutterstock_2627251889.jpg",
              40,
              25,
              null),

          itemNoticia(
              "gremio.if",
              "3d",
              "O Grêmio Estudantil divulga ação de conscientização voltada à importância da participação ativa dos alunos no ambiente escolar, destacando o papel do diálogo, da inclusão e do engajamento coletivo na construção de uma comunidade educacional mais crítica e colaborativa.",
              "https://observatorio.movimentopelabase.org.br/wp-content/uploads/2022/07/shutterstock-1937721487-970x570.jpg",
              45,
              20,
              null),

          itemNoticia(
              "jogos_oficial.if",
              "3d",
              "É publicado um panorama geral sobre o universo dos jogos, destacando sua evolução, os impactos no desenvolvimento cognitivo e social dos estudantes, além de seu papel como ferramenta de aprendizado, entretenimento e integração no ambiente educacional.",
              "https://cdn.focoradical.com.br/newfoco/banners/20251217173547IMG9373.jpg",
              80,
              50,
              null),

          itemNoticia(
              "pesquisas.if",
              "4d",
              "Pesquisas recentes no campo do entretenimento digital, destacam como jogos, filmes e redes sociais influenciam o comportamento dos jovens e contribuem para novas formas de aprendizado, interação e expressão cultural no ambiente escolar.",
              "https://midias-totvs.totvs.com/wp-content/uploads/2023/04/tecnologias-digitais.jpg",
              65,
              30,
              null),
        ],
      ),
    );
  }

  Widget itemNoticia(String usuario, String tempo, String titulo, String imagem, int curtidas, int comentarios, VoidCallback? aoClicar) {
    //para efeito de toque: inkwell
    return InkWell(
      onTap: aoClicar,
      //para o texto não ficar colado nas beiradas da tela: padding
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              //perfil de usuário
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.green[100],
                  child: Icon(Icons.person, size: 15, color: Colors.green[800]),
                ),
                const SizedBox(width: 8),
                Text(usuario, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                const Icon(Icons.check_circle, size: 14, color: Colors.blue),
                const SizedBox(width: 4),
                Text("- $tempo", style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              //a noticia e bordas da imagem
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(titulo, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    //máximo de 4 linhas para os textos
                    maxLines: 4, overflow: TextOverflow.ellipsis)),
                const SizedBox(width: 10),
                ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(imagem, width: 100, height: 70, fit: BoxFit.cover)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              //curtidas e comentarios
              children: [
                const Icon(Icons.thumb_up_alt_outlined, size: 18, color: Colors.grey),
                const SizedBox(width: 5),
                Text(curtidas.toString()),
                const SizedBox(width: 20),
                const Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey),
                const SizedBox(width: 5),
                Text(comentarios.toString()),
                //spacer empurra o icone para o final (compartilhar)
                const Spacer(),
                const Icon(Icons.share_outlined, size: 18, color: Colors.grey),
              ],
            ),
            //linha dividindo as noticias
            const Divider(),
          ],
        ),
      ),
    );
  }
}