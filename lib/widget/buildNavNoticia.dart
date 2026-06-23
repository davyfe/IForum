import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/comentario_model.dart';

//recebe um comentariomodel e transforma
class BuildNavNoticia extends StatelessWidget {
  final ComentarioModel comentario;

  const BuildNavNoticia({super.key, required this.comentario});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
            SizedBox(width: 8),
            Text(
              comentario.autor,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Text(comentario.tempo),
            Spacer(),
            Icon(Icons.more_horiz),
          ],
        ),
        SizedBox(height: 5),
        Text(
          comentario.texto,
          style: TextStyle(fontSize: 15),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),
        buildInteracao(
          comentario.likes,
          comentario.comentarios,
          comentario.reacao,
        ),
        SizedBox(height: 10),
        const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildInteracao(int likes, int comentarios, String reacao) {
    return Row(
      children: [
        Chip(
          backgroundColor: Cores.fundo,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.thumb_up_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text('$likes |'),
              const SizedBox(width: 8),
              const Icon(
                Icons.thumb_down_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
            ],
          ),
          labelPadding: const EdgeInsets.only(left: 4, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        SizedBox(width: 10),
        Chip(
          backgroundColor: Cores.fundo,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text('$comentarios'),
            ],
          ),
          labelPadding: const EdgeInsets.only(left: 4, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        Spacer(),
        Chip(
          backgroundColor: Cores.fundo,
          label: Text(
            reacao,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          labelPadding: const EdgeInsets.only(left: 2, right: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ],
    );
  }
}
