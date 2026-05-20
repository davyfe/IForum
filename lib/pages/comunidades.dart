import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/PropriedadesComunidades.dart';
import 'package:iforum/pages/navPage.dart';

class Comunidades extends StatefulWidget {
  const Comunidades({super.key});

  @override
  State<Comunidades> createState() => _ComunidadesState();
}

class _ComunidadesState extends State<Comunidades> {
  List comunidades = [
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
            title: Text(
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

                  const Text(
                    "Recomendado",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                      children: [
                        _buildCard(propriedade: comunidades[0]),
                        _buildCard(propriedade: comunidades[1]),
                        _buildCard(propriedade: comunidades[2]),
                        _buildCard(propriedade: comunidades[3]),
                        _buildCard(propriedade: comunidades[4]),
                        _buildCard(propriedade: comunidades[5]),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    "Comunidades Populares",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                      children: [
                        _buildCard(propriedade: comunidades[0]),
                        _buildCard(propriedade: comunidades[1]),
                        _buildCard(propriedade: comunidades[2]),
                        _buildCard(propriedade: comunidades[3]),
                        _buildCard(propriedade: comunidades[4]),
                        _buildCard(propriedade: comunidades[5]),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    "Outras Comunidades",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                      children: [
                        _buildCard(propriedade: comunidades[0]),
                        _buildCard(propriedade: comunidades[1]),
                        _buildCard(propriedade: comunidades[2]),
                        _buildCard(propriedade: comunidades[3]),
                        _buildCard(propriedade: comunidades[4]),
                        _buildCard(propriedade: comunidades[5]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicos() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            children: [
              _buildChips(texto: "Cultura"),
              _buildChips(texto: "Filmes e TV"),
              _buildChips(texto: "Cultura pop"),
              _buildChips(texto: "Jogos"),
              _buildChips(texto: "Tecnologia"),
              _buildChips(texto: "Esportes"),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              _buildChips(texto: "Bate-Papo"),
              _buildChips(texto: "Desenvolvimento"),
              _buildChips(texto: "Notícias e política"),
              _buildChips(texto: "Ciências Exatas"),
              _buildChips(texto: "Botânica"),
              _buildChips(texto: "Música"),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              _buildChips(texto: "Eletrônica"),
              _buildChips(texto: "Carros e veículos"),
              _buildChips(texto: "Negócios e finanças"),
              _buildChips(texto: "Ciências Humanas"),
              _buildChips(texto: "Hobbies"),
              _buildChips(texto: "Arte"),
            ],
          ),
          const SizedBox(height: 10),
        ],
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
      padding: const EdgeInsets.only(top: 3, bottom: 10, left: 10, right: 10),
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
              // Mudando a cor do avatar dinamicamente de acordo com a propriedade da classe
              CircleAvatar(radius: 18, backgroundColor: propriedade.corAvatar),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    propriedade.nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
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
