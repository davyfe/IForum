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
      // Criar o topo da tela
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        leading: const Icon(Icons.arrow_back),
        title: const Text('Notícias', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      // Conteúdo da tela com a chamada direta dos parâmetros
      body: ListView(
        children: [
          itemNoticia(
            "ifnews",
            "1d",
            "A certificação de metodologias que nos auxiliam a lidar com o acompanhamento de consumo é uma das consequências das diversas transformações sociais.",
            "https://img.freepik.com/fotos-gratis/professor-de-homem-usando-oculos-verificando-o-registro-de-classe-olhando-para-a-camera-intrigado-com-a-expressao-pensativa-pensando-sentado-na-mesa-da-escola-na-frente-do-quadro-negro-na-sala-de-aula_141793-131719.jpg",
            78,
            30,
          ),
          itemNoticia(
            "entreterimento_if",
            "1d",
            "Não obstante o consenso sobre a necessidade de qualificação, ainda não se demonstrou convincentemente que essa medida vá contribuir efetivamente.",
            "https://i.pinimg.com/736x/c2/1e/b0/c21eb09c967263b7d34e713da318f093.jpg",
            33,
            12,
          ),
          itemNoticia(
            "meio_ambiente.if",
            "2d",
            "As experiências acumuladas demonstram que a percepção das dificuldades afeta positivamente a correta previsão de alternativas às soluções ortodoxas.",
            "https://www.agricultura.sc.gov.br/wp-content/uploads/2024/06/WhatsApp-Image-2024-06-04-at-16.51.49.jpeg",
            55,
            35,
          ),
          itemNoticia(
            "cipa.if",
            "3d",
            "Foi publicado uma ação de conscientização sobre a importância da educação no ambiente escolar e a iniciativa destacou o compromisso coletivo.",
            "https://internationalschool.global/wp-content/uploads/2025/08/shutterstock_2627251889.jpg",
            40,
            25,
          ),
        ],
      ),
    );
  }

  // Função que recebe as informações direto nos parâmetros
  Widget itemNoticia(
      String usuario,
      String tempo,
      String titulo,
      String imagem,
      int curtidas,
      int comentarios,
      ) {
    return InkWell(
      onTap: () {
        // Lógica de navegação aqui
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Linha com avatar, nome e tempo
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(imagem),
                ),
                const SizedBox(width: 8),
                Text(
                  usuario,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.check_circle, size: 14, color: Colors.blue),
                const SizedBox(width: 4),
                Text(
                  "- $tempo",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Linha com texto e foto lateral
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imagem,
                    width: 100,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Linha de interação
            Row(
              children: [
                Icon(Icons.thumb_up_alt_outlined, size: 18, color: Colors.grey[600]),
                const SizedBox(width: 5),
                Text(curtidas.toString(), style: TextStyle(color: Colors.grey[600])),
                const SizedBox(width: 20),
                Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey[600]),
                const SizedBox(width: 5),
                Text(comentarios.toString(), style: TextStyle(color: Colors.grey[600])),
                const Spacer(),
                Icon(Icons.share_outlined, size: 18, color: Colors.grey[600]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}