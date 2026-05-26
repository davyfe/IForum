import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iforum/navPage.dart';

void main() {
  runApp(
    MaterialApp(
      home: const NavPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    ),
  );
}