import 'package:flutter/material.dart';
import 'package:iforum/pages/home.dart';
import 'package:iforum/pages/comunidades.dart';

class navPage extends StatefulWidget{
  const navPage({super.key});

  @override
  State<navPage> createState() => _navPageState();
}

class _navPageState extends State<navPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      Home(),
      Center(child: Text("Página Notícias", style: TextStyle(fontSize: 32))),
      Comunidades(),
      Center(child: Text("Página Notificações", style: TextStyle(fontSize: 32))),
      Center(child: Text("Página Perfil", style: TextStyle(fontSize: 32))),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: buildBottomnavigationbar(),
    );
  }

  buildBottomnavigationbar(){
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          selectedIndex = index;
        });
  },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""), // home
        BottomNavigationBarItem(icon: Icon(Icons.article), label: ""), // noticias
        BottomNavigationBarItem(icon: Icon(Icons.groups), label: ""), // comunidades
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""), // notificações
        BottomNavigationBarItem(icon: CircleAvatar(radius: 12), label: ""), // perfil
      ],
    );
  }
}