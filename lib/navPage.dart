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
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List pages = [const Home(), const Notificacoes(), const Perfil()];

    return Scaffold(
      backgroundColor: Cores.fundo,
      drawer: Menu(navigatorKey: _navigatorKey),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => pages[selectedIndex],
          );
        },
      ),
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
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
        _navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => pages[index]),
              (route) => false,
        );
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
        const BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notificações"),
        BottomNavigationBarItem(icon: CircleAvatar(radius: 12, backgroundColor: Cores.avatar), label: "Você"),
      ],
    );
  }
}