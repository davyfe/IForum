import 'package:flutter/material.dart';
import '../domain/PropriedadePost.dart';
import 'package:iforum/cores.dart';

class DetailPost extends StatefulWidget{
  PropriedadePost propriedade;
  DetailPost({super.key, required this.propriedade});

  @override
  State<DetailPost> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost>{
  PropriedadePost get propriedade => widget.propriedade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      appBar: AppBar(backgroundColor: Cores.fundo,),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 18, backgroundColor: Cores.avatar),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.propriedade.comunidade,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(widget.propriedade.autor),
                            SizedBox(width: 5),
                            CircleAvatar(radius: 1.8, backgroundColor: Colors.black54),
                            SizedBox(width: 5),
                            Text(widget.propriedade.tempo),
                          ]
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  widget.propriedade.titulo,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                ),
                SizedBox(height: 5),
                if(propriedade.tipo.isNotEmpty)...[
                  _buildTags(propriedade.tipo),
                  SizedBox(height: 5),
                ],
                if(propriedade.conteudo.isNotEmpty)...[
                  Text(widget.propriedade.conteudo),
                  SizedBox(height: 5),
                ],
                if(propriedade.urlImagem.isNotEmpty)...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      propriedade.urlImagem,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
                if(propriedade.anexo)...[
                  _buildAnexo(),
                  SizedBox(height: 5),
                ],
                SizedBox(height: 8),
                buildInteracao(propriedade.likes, propriedade.comentarios),
              ],
            ),
          ),
          const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        ],
      ),
    );
  }

  Widget _buildTags(String tipo) {
    return Chip(
      label: Text(
        tipo,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      backgroundColor: _getCor(tipo),
      padding: const EdgeInsets.only(left: 4, right: 4),
      side: BorderSide.none,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }

  Color _getCor(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'material':
        return Colors.indigo;
      case 'ajuda':
        return Colors.yellow.shade700;
      case 'dúvida':
        return Colors.red;
      case 'outros':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget _buildAnexo(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black54, width: 0.3),
      ),
      child: Row(
        children: [
          Icon(Icons.picture_as_pdf, color: Colors.red, size: 30),
          SizedBox(width: 8),
          Column(
            children: [
              Text(
                'livro.pdf',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('250mb', textAlign: TextAlign.start),
            ],
          ),
          SizedBox(width: 8),
          Icon(Icons.file_download_outlined, size: 18),
        ],
      ),
    );
  }

  Widget buildInteracao(int likes, int comentarios) {
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
          label: const Icon(
            Icons.share_outlined,
            size: 20,
            color: Colors.black54,
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