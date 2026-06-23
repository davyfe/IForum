import 'package:flutter/material.dart';
import 'package:iforum/domain/noticia_model.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/navNoticia.dart';

class BuildNoticia extends StatelessWidget {
  final NoticiaModel noticia;

  const BuildNoticia({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavNoticia(noticia: noticia),
            ),
          );
        },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 12, backgroundColor: noticia.tema),
                    const SizedBox(width: 8),
                    Text(noticia.portal,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Text(noticia.tempo),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        noticia.titulo,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        noticia.urlImagem,
                        width: 120,
                        height: 102,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Por ${noticia.autor}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 8),
                _buildInteracao(noticia.likes, noticia.comentarios),
              ],
            ),
          ),
          const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        ],
      ),
    );
  }

  Widget _buildInteracao(int likes, int comentarios) {
    return Row(
      children: [
        Chip(
          backgroundColor: Cores.fundo,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.thumb_up_alt_outlined, size: 16, color: Colors.black54),
              const SizedBox(width: 6),
              Text('$likes |'),
              const SizedBox(width: 8),
              const Icon(Icons.thumb_down_alt_outlined, size: 16, color: Colors.black54),
            ],
          ),
          labelPadding: const EdgeInsets.only(left: 4, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
        const SizedBox(width: 10),
        Chip(
          backgroundColor: Cores.fundo,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.chat_bubble_outline_rounded, size: 16, color: Colors.black54),
              const SizedBox(width: 6),
              Text('$comentarios'),
            ],
          ),
          labelPadding: const EdgeInsets.only(left: 4, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
        const Spacer(),
        Chip(
          backgroundColor: Cores.fundo,
          label: const Icon(Icons.share_outlined, size: 16, color: Colors.black54),
          labelPadding: const EdgeInsets.only(left: 2, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ],
    );
  }
}