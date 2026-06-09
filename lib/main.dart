import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iforum/navPage.dart';

void main() {
  runApp(
    MaterialApp(
      home: const NavPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF006b3f)),
        scaffoldBackgroundColor: Color(0xFFf4f6f9),
        brightness: Brightness.light,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF006b3f),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
