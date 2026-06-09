import 'package:flutter/material.dart';
import 'package:iforum/pages/home.dart';
import 'package:iforum/pages/perfil.dart';
import 'package:iforum/pages/notificacoes.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/menu.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [const Home(), const Notificacoes(), const Perfil()];

    return Scaffold(
      drawer: Menu(),
      body: pages[selectedIndex],
      bottomNavigationBar: buildBottomnavigationbar(pages),
    );
  }

  buildBottomnavigationbar(List pages) {
    return BottomNavigationBar(
      backgroundColor: Cores.fundo,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
        const BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notificações",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
          label: "Você",
        ),
      ],
    );
  }
}
