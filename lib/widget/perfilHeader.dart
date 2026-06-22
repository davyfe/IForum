import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/usuario_model.dart';

class PerfilHeader extends StatelessWidget {
  final UsuarioModel usuario;

  const PerfilHeader({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 20,
        top: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black, Cores.verdeifal],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 45, backgroundColor: Colors.white),
          const SizedBox(height: 10),
          Text(
            usuario.nome,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '@${usuario.username}',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '${usuario.seguidores}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Seguidores',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(width: 5),
              Text(
                '· ${usuario.seguindo}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Seguindo',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (usuario.bio.isNotEmpty)
            Text(
              usuario.bio,
              style: const TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.school, color: Colors.white, size: 18),
              const SizedBox(width: 5),
              Text(
                'Téc. em ${usuario.curso}',
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(width: 15),
              const Icon(Icons.location_city, color: Colors.white, size: 18),
              const SizedBox(width: 5),
              Text(
                'Campus ${usuario.campus}',
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}