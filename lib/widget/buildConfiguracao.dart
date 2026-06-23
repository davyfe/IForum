import 'package:flutter/material.dart';
import '../cores.dart';

class BuildConfiguracao extends StatefulWidget {
  IconData icone;
  String titulo, subtitulo, textoDireita;
  Color color;

  BuildConfiguracao({
    super.key,
    required this.icone,
    required this.titulo,
    this.subtitulo = "",
    this.textoDireita = "",
    this.color = Colors.black87,
  });

  @override
  State<BuildConfiguracao> createState() => _BuildConfiguracaoState();
}

class _BuildConfiguracaoState extends State<BuildConfiguracao> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      visualDensity: VisualDensity.compact,
      leading: Icon(widget.icone, color: widget.color, size: 26),
      title: Text(
        widget.titulo,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: widget.color,
        ),
      ),
      subtitle:
          widget.subtitulo.isNotEmpty
              ? Text(
                widget.subtitulo,
                style: TextStyle(color: Cores.textoTerciario, fontSize: 13),
              )
              : null,
      trailing:
          widget.textoDireita.isNotEmpty
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.textoDireita,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: widget.color,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.chevron_right, color: widget.color),
                ],
              )
              : Icon(Icons.chevron_right, color: widget.color),
      onTap: () {},
    );
  }
}
