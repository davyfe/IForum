import 'package:flutter/material.dart';
import 'package:iforum/domain/PropriedadePost.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/detailPost.dart';

class BuildPost extends StatefulWidget {
  PropriedadePost propriedade;
  BuildPost({super.key, required this.propriedade});

  @override
  State<BuildPost> createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost>{
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPost(propriedade: widget.propriedade);
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 12, backgroundColor: Cores.avatar),
                    SizedBox(width: 8),
                    Text(
                      widget.propriedade.autor,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      Icons.chevron_right,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 3),
                    Text(
                      widget.propriedade.comunidade,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(widget.propriedade.tempo),
                    Spacer(),
                    Icon(Icons.more_horiz),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  widget.propriedade.titulo,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                if (widget.propriedade.conteudo.isNotEmpty) ...[
                  SizedBox(height: 5),
                  Text(
                    widget.propriedade.conteudo,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (widget.propriedade.urlImagem.isNotEmpty) ...[
                  SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.propriedade.urlImagem,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => const SizedBox.shrink(),
                    ),
                  ),
                ],
                if (widget.propriedade.anexo) ...[
                  SizedBox(height: 5),
                  Container(
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
                  ),
                ],
                SizedBox(height: 8),
                buildInteracao(widget.propriedade.likes, widget.propriedade.comentarios),
              ],
            ),
          ),
          const Divider(color: Colors.black54, thickness: 0.2, height: 1),
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