import 'package:flutter/material.dart';
// Importa o arquivo que eu criou.
import 'pages/criar_tela_post.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editor de Post',
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug" no canto
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Habilita o design moderno do Material 3
      ),
      // Define a tela inicial como a tela que você criou
      home: const CriarPostTela(),
    );
  }
}