import 'package:flutter/material.dart';

class Comunidades extends StatefulWidget {
  const Comunidades({super.key});

  @override
  State<Comunidades> createState() => _ComunidadesState();
}

class _ComunidadesState extends State<Comunidades> {
  @override
  Widget build(BuildContext context) {
    final recomendados = [
      {
        "nome": "dit.ifal",
        "participantes": "250 participantes",
        "descricao": "Esta é a comunidade do Núcleo de Desenvolvimento e Inovação Tecnológica do Ifal Campus Arapiraca, ou só DIT :)",
      },
      {
        "nome": "volei.if",
        "participantes": "125 participantes",
        "descricao": "Comunidade de Vôlei do Ifal Arapiraca!",
      },
      {
        "nome": "desenhifal",
        "participantes": "56 participantes",
        "descricao": "Aprimore suas habilidades e compartilhe sua arte com uma comunidade de mentes criativas.",
      },
      {
        "nome": "jifal",
        "participantes": "565 participantes",
        "descricao": "Atualizações sobre o JIFAl\n#JIFAL26",
      },
    ];

    final criativo = [
      {
        "nome": "devs.if",
        "participantes": "580 participantes",
        "descricao": "Espaço dedicado para quem ama código! Aqui compartilhamos projetos de Python e Flutter.",
      },
      {
        "nome": "literifal",
        "participantes": "245 participantes",
        "descricao": "Clube de leitura e escrita criativa. Debatemos clássicos da literatura e organizamos o sarau.",
      },
      {
        "nome": "cine.if",
        "participantes": "112 participantes",
        "descricao": "Para os amantes da sétima arte. Assistimos filmes e documentários todas as sextas-feiras.",
      },
      {
        "nome": "roboti.if",
        "participantes": "89 participantes",
        "descricao": "Grupo focado em robótica competitiva e automação. Se você gosta de Arduino, este é o lugar!",
      },
    ];

    final cursos = [
      {
        "nome": "info.ifal",
        "participantes": "450 participantes",
        "descricao": "Focado em desenvolvimento de sistemas, web e mobile. Discutimos algoritmos e TI.",
      },
      {
        "nome": "eletro.ifal",
        "participantes": "320 participantes",
        "descricao": "Tudo sobre circuitos elétricos, automação industrial e manutenção elétrica.",
      },
      {
        "nome": "renovaveis.if",
        "participantes": "180 participantes",
        "descricao": "Especializado em energia solar, eólica e tecnologias de geração limpa.",
      },
      {
        "nome": "quimica.if",
        "participantes": "210 participantes",
        "descricao": "Voltada para análises laboratoriais, processos industriais e química orgânica.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text(
          "Comunidades",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        children: [
          _buildCategoriaGrid("Recomendado para Você", recomendados),
          _buildCategoriaGrid("Criatividade", criativo),
          _buildCategoriaGrid("Cursos", cursos),
        ],
      ),
    );
  }

  Widget _buildCategoriaGrid(String categoria, List<Map<String, String>> dados) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 10, top: 16),
          child: Text(
            categoria,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          height: 240, // Altura que segura as 2 linhas do GridView
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12, // Espaço entre as colunas
            crossAxisSpacing: 10, // Espaço entre as linhas
            scrollDirection: Axis.horizontal,

            // IMPORTANTE: Como o GridView tenta fazer os itens ficarem quadrados,
            // precisamos dessa proporção (altura da linha / largura do card)
            // para ele respeitar a largura do seu Container original.
            // childAspectRatio: 0.45,

            // Passando a lista dinamicamente
            children: dados.map((item) {
              return _cardConvite(
                item['nome']!,
                item['participantes']!,
                item['descricao']!,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _cardConvite(String nome, String participantes, String descricao) {
    return Container(
      // Removi o margin: EdgeInsets.only(right: 12) daqui porque
      // o próprio mainAxisSpacing do GridView já faz esse espaçamento agora.
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 16, backgroundColor: Color(0xFF8C9EFF)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            nome,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.check_circle, size: 14, color: Colors.blue),
                      ],
                    ),
                    Text(
                      participantes,
                      style: TextStyle(color: Colors.grey[700], fontSize: 10),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  shape: const StadiumBorder(),
                  elevation: 0,
                  minimumSize: const Size(60, 25),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                ),
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            descricao,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}