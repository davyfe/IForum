import 'package:flutter/material.dart';

class AnexoCard extends StatelessWidget {
  final String nome;
  final String tamanho;

  const AnexoCard({super.key, this.nome = 'livro.pdf', this.tamanho = '250mb'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black54, width: 0.3),
      ),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf, color: Colors.red, size: 30),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(tamanho),
            ],
          ),
          const SizedBox(width: 8),
          const Icon(Icons.file_download_outlined, size: 18),
        ],
      ),
    );
  }
}
