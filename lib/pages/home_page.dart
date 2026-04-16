import 'package:iforum/pages/home.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List pages = [
    Home(),
    Center(child: Text("Página Notícias", style: TextStyle(fontSize: 32))),
    Center(child: Text("Página Comunidades", style: TextStyle(fontSize: 32))),
    Center(child: Text("Página Notificações", style: TextStyle(fontSize: 32))),
    Center(child: Text("Página Perfil", style: TextStyle(fontSize: 32))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Pesquisar",
            prefixIcon: const Icon(Icons.search),
            fillColor: Colors.white.withValues(alpha: 0.9),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
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