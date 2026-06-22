import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/home.dart';
import 'package:iforum/pages/perfil.dart';
import 'package:iforum/pages/notificacoes.dart';
import 'package:iforum/pages/menu.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int selectedIndex = 0;

  // para não reciriar as telas a cada build
  static const List<Widget> _pages = [Home(), Notificacoes(), Perfil()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      body: _pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (i) => setState(() => selectedIndex = i),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          const NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
          NavigationDestination(
            icon: CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
            label: 'Você',
          ),
        ],
      ),
    );
  }
}
