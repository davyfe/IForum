import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/navPage.dart';

void main() {
  runApp(
    MaterialApp(
      home: const NavPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Cores.verdeifal,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Cores.fundo,
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        appBarTheme: AppBarTheme(
          backgroundColor: Cores.verdeifal,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Cores.fundo,
          indicatorColor: Cores.verdeifal.withValues(alpha: 0.15),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            final isSelecionado = states.contains(WidgetState.selected);
            return GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: isSelecionado ? Cores.verdeifal : Colors.grey,
            );
          }),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            final isSelecionado = states.contains(WidgetState.selected);
            return IconThemeData(
              color: isSelecionado ? Cores.verdeifal : Colors.grey,
            );
          }),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Cores.fundo,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          side: BorderSide.none,
        ),
      ),
    ),
  );
}
