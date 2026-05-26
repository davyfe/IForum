import 'package:flutter/material.dart';
import 'package:iforum/pages/noticias.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/comunidades.dart';

class Menu extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const Menu({super.key, required this.navigatorKey});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Cores.fundo,
      child: ListView(
        padding: const EdgeInsets.only(top: 30, bottom: 20),
        children: [
          _buildOpcoes(
            icone: Icons.local_fire_department_outlined,
            tamanhoIcone: 24,
            titulo: "Populares",
            tela: Scaffold(body: Center(child: Text("Populares"))),
          ),
          _buildOpcoes(
            icone: Icons.access_time_outlined,
            titulo: "Recentes",
            tela: Scaffold(body: Center(child: Text("Recentes"))),
          ),
          _buildOpcoes(
            icone: Icons.article_outlined,
            titulo: "Notícias",
            tela: const Noticias(),
          ),
          _buildOpcoes(
            icone: Icons.travel_explore_outlined,
            titulo: "Explorar Comunidades",
            tela: const Comunidades(),
          ),
          const SizedBox(height: 5),
          const Divider(color: Colors.black54, thickness: 0.1, height: 1),
          ExpansionTile(
            title: const Text(
              "Minhas Comunidades",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            shape: const Border(),
            collapsedShape: const Border(),
            tilePadding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildComunidades(nome: "devs.if", cor: Cores.avatar),
              _buildComunidades(nome: "fotografias", cor: Colors.yellow.shade700),
              _buildComunidades(nome: "estudos.ifal", cor: Colors.redAccent),
              _buildComunidades(nome: "monc_ifal", cor: Colors.green),
            ],
          ),
          const Divider(color: Colors.black54, thickness: 0.1, height: 1),
          ExpansionTile(
            title: const Text(
              "Sobre",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            shape: const Border(),
            collapsedShape: const Border(),
            tilePadding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildOpcoes(
                icone: Icons.receipt_long_outlined,
                titulo: "Regras do App",
                tela: Scaffold(
                  body: Center(
                    child: Text(
                      "Regras foram feitas para\nserem quebradas! ;D",
                    ),
                  ),
                ),
              ),
              _buildOpcoes(
                icone: Icons.key_outlined,
                titulo: "Política de Privacidade",
                tela: Scaffold(
                  body: Center(
                    child: Text(
                      "Política de privacidade\n(não somos o Facebook!!!)",
                    ),
                  ),
                ),
              ),
              _buildOpcoes(
                icone: Icons.help_outline,
                titulo: "Central de Ajuda",
                tela: Scaffold(body: Center(child: Text("Central de Ajuda"))),
              ),
              _buildOpcoes(
                icone: Icons.settings_outlined,
                titulo: "Versão",
                subtitulo: "0.0.0.2",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOpcoes({
    required IconData icone,
    double tamanhoIcone = 22,
    required String titulo,
    String? subtitulo,
    Widget? tela,
  }) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      visualDensity: VisualDensity.compact,
      leading: SizedBox(width: 30, child: Icon(icone, size: tamanhoIcone)),
      title: Text(
        titulo,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle:
      subtitulo != null
          ? Text(
        subtitulo,
        style: TextStyle(color: Colors.grey[600], fontSize: 13),
      )
          : null,
      onTap: () {
        if (tela != null) {
          Navigator.pop(context);
          widget.navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (context) => tela),
          );
        }
      },
    );
  }

  Widget _buildComunidades({required String nome, required Color cor}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      visualDensity: VisualDensity.compact,
      leading: CircleAvatar(backgroundColor: cor, radius: 12),
      title: Text(
        nome,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
  }
}