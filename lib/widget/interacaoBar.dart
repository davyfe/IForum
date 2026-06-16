import 'package:flutter/material.dart';

import '../cores.dart';

class InteracaoBar extends StatelessWidget {
  final int likes;
  final int comentarios;
  final Widget trailing;

  const InteracaoBar({
    super.key,
    required this.likes,
    required this.comentarios,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildChip(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.thumb_up_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text('$likes |', style: const TextStyle(color: Colors.black54)),
              const SizedBox(width: 8),
              const Icon(
                Icons.thumb_down_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _buildChip(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text(
                '$comentarios',
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
        const Spacer(),
        _buildChip(trailing),
      ],
    );
  }

  Widget _buildChip(Widget conteudo) {
    return RawChip(
      label: conteudo,
      color: WidgetStateProperty.all(Cores.fundo),
      side: const BorderSide(color: Colors.black26, width: 0.5),
      shape: const StadiumBorder(),
      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      showCheckmark: false,
      onPressed: null,
    );
  }
}
