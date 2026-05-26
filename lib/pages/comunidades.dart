import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/PropriedadeComunidade.dart';

class Comunidades extends StatefulWidget {
  const Comunidades({super.key});

  @override
  State<Comunidades> createState() => _ComunidadesState();
}

class _ComunidadesState extends State<Comunidades> {
  final List<PropriedadesComunidades> comunidades = [
    PropriedadesComunidades(
      nome: "DevsIf",
      membros: 5.6,
      descricao:
      "Comunidade de desenvolvimento to Ifal Campus Arapiraca! Compartilhe seus projetos, tire dúvidas e +!",
      corAvatar: Cores.avatar,
    ),
    PropriedadesComunidades(
      nome: "Xadrez Arapiraca",
      membros: 1.0,
      descricao:
      "Para quem curte estratégia! Treinos, campeonatos de xadrez e desafios de lógica para fritar o cérebro.",
      corAvatar: Colors.yellow.shade700,
    ),
    PropriedadesComunidades(
      nome: "Ifal Games",
      membros: 3.2,
      descricao:
      "Para os apaixonados por jogos! Organização de campeonatos de eSports, discussões e jogatinas do campus.",
      corAvatar: Colors.green,
    ),
    PropriedadesComunidades(
      nome: "Cine Ifal",
      membros: 1.4,
      descricao:
      "Clube de cinema e cultura pop. Discussões sobre filmes, séries, animes e produções autorais dos alunos.",
      corAvatar: Colors.red,
    ),
    PropriedadesComunidades(
      nome: "Vôlei IFAL",
      membros: 10.1,
      descricao:
      "A comunidade do esporte mais famoso do campus! Fique por dentro dos treinos, rachas e das datas do interclasses.",
      corAvatar: Colors.yellow.shade700,
    ),
    PropriedadesComunidades(
      nome: "Bate-Papo",
      membros: 12.5,
      descricao:
      "O ponto de encontro geral dos estudantes. Conversas aleatórias, memes e novas amizades no campus.",
      corAvatar: Colors.green,
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
            title: const Text(
              "Comunidades",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {},
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Explore comunidades por assuntos",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  _buildTopicos(),
                  _buildSecaoComunidades("Recomendado", comunidades),
                  _buildSecaoComunidades("Comunidades Populares", comunidades),
                  _buildSecaoComunidades("Outras Comunidades", comunidades),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecaoComunidades(String titulo, List<PropriedadesComunidades> lista) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 215,
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 280,
            scrollDirection: Axis.horizontal,
            children: lista.map((item) => _buildCard(propriedade: item)).toList(),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildTopicos() {
    final linhasDeTopicos = [
      ["Cultura", "Filmes e TV", "Cultura pop", "Jogos", "Tecnologia", "Esportes"],
      ["Bate-Papo", "Desenvolvimento", "Notícias e política", "Ciências Exatas", "Botânica", "Música"],
      ["Eletrônica", "Carros e veículos", "Negócios e finanças", "Ciências Humanas", "Hobbies", "Arte"],
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: linhasDeTopicos.map((linha) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Wrap(
              spacing: 8.0,
              children: linha.map((texto) => _buildChips(texto: texto)).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildChips({required String texto}) {
    return ActionChip(
      label: Text(texto, style: const TextStyle(fontWeight: FontWeight.w500)),
      backgroundColor: Cores.fundo,
      labelPadding: const EdgeInsets.only(left: 4, right: 2),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      onPressed: () {},
    );
  }

  Widget _buildCard({required PropriedadesComunidades propriedade}) {
    return Container(
      width: 280,
      padding: const EdgeInsets.fromLTRB(10, 3, 10, 10),
      decoration: BoxDecoration(
        color: Cores.fundo,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black54, width: 0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 18, backgroundColor: propriedade.corAvatar),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    propriedade.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text("${propriedade.membros} mil membros"),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Cores.verdeifal,
                  shape: const StadiumBorder(),
                  elevation: 0,
                  minimumSize: const Size(60, 25),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: const Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            propriedade.descricao,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}