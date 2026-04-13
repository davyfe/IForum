import 'dart:ui';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildContainer()
        ],
      ),
    );
  }
}

String titulo = 'testando...';
buildContainer(){
  return Container(
    margin: EdgeInsets.all(40),
    padding: EdgeInsets.only(left: 20),
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.grey[350],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(fontFamily: 'Times New Roman',fontSize: 40, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
