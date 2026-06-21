import 'package:flutter/material.dart';
import 'package:iforum/domain/post_model.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/pages/detailPost.dart';
import '../db/fakeComunidades.dart';
import '../domain/comunidade_model.dart';
import 'package:iforum/widget/interacaoBar.dart';
import 'package:iforum/widget/anexoCard.dart';

// pode ignorar essa função por enquanto...
ComunidadeModel? buscarComunidade(int id) {
  try {
    return FakeComunidades.comunidades.firstWhere(
      (comunidade) => comunidade.id == id,
    );
  } catch (e) {
    return null;
  }
}

class BuildPost extends StatefulWidget {
  final PostModel propriedade;

  const BuildPost({super.key, required this.propriedade});

  @override
  State<BuildPost> createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost> {
  @override
  Widget build(BuildContext context) {
    final comunidade = buscarComunidade(widget.propriedade.comunidadeId);

    return InkWell(
      onTap: () {
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
                      comunidade?.nome ?? "Comunidade",
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
                          (context, error, stackTrace) =>
                              const SizedBox.shrink(),
                    ),
                  ),
                ],
                if (widget.propriedade.anexo) ...[
                  const SizedBox(height: 5),
                  const AnexoCard(),
                ],
                SizedBox(height: 8),
                InteracaoBar(
                  likes: widget.propriedade.likes,
                  comentarios: widget.propriedade.comentarios,
                  trailing: const Icon(
                    Icons.share_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.black54, thickness: 0.2, height: 1),
        ],
      ),
    );
  }
}
