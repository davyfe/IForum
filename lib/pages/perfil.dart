import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/db/UsuarioDao.dart';
import 'package:iforum/domain/usuario_model.dart';
import 'package:iforum/pages/menuConfig.dart';
import 'package:iforum/widget/perfilHeader.dart';
import 'package:iforum/widget/perfilPostsTab.dart';
import 'package:iforum/widget/stickyTabBar.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<UsuarioModel?> _usuarioFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _usuarioFuture = UsuarioDao().buscarPorUsername('pdrolopes');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UsuarioModel?>(
        future: _usuarioFuture,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Usuário não encontrado.'));
          }

          final usuario = snapshot.data!;

          return CustomScrollView(
            slivers: [

              SliverAppBar(
                backgroundColor: Cores.verdeifal,
                pinned: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white, size: 22),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Colors.white, size: 20),
                  ),
                  IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MenuConfig()),
                    ),
                    icon: const Icon(Icons.menu, color: Colors.white),
                  ),
                ],
              ),

              SliverToBoxAdapter(
                child: PerfilHeader(usuario: usuario),
              ),

              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Cores.verdeifal,
                    indicatorWeight: 3.0,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(text: 'Posts'),
                      Tab(text: 'Comentários'),
                    ],
                  ),
                ),
              ),

              SliverFillRemaining(
                hasScrollBody: true,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    PerfilPostsTab(autor: usuario.username),
                    const Center(
                      child: Text(
                        'Você ainda não tem comentários.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}