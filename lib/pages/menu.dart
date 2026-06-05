import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/widget/buildDrawer.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Cores.fundo,
        child: BuildDrawer(),
    );
  }
}