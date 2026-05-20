import 'package:flutter/material.dart';
import 'package:iforum/pages/home.dart';
import 'package:iforum/pages/perfil.dart';
import 'package:iforum/pages/notificacoes.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/menu.dart';

class navPage extends StatefulWidget {
  const navPage({super.key});

  @override
  State<navPage> createState() => _navPageState();
}

class _navPageState extends State<navPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [Home(), Notificacoes(), Perfil()];
    return Scaffold(
      backgroundColor: Cores.fundo,
      drawer: const Menu(),
      body: pages[selectedIndex],
      bottomNavigationBar: buildBottomnavigationbar(),
    );
  }

  buildBottomnavigationbar() {
    return BottomNavigationBar(
      backgroundColor: Cores.fundo,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notificações"),
        BottomNavigationBarItem(icon: CircleAvatar(radius: 12, backgroundColor: Cores.avatar), label: "Você"),
      ],
    );
  }
}
