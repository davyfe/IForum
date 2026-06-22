import 'package:flutter/material.dart';
import '../db/fakeComunidades.dart';
import '../domain/comunidade_model.dart';
import '../domain/post_model.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/widget/interacaoBar.dart';
import 'package:iforum/widget/anexoCard.dart';

ComunidadeModel? buscarComunidade(int id) {
  try {
    return FakeComunidades.comunidades.firstWhere(
          (comunidade) => comunidade.id == id,
    );
  } catch (e) {
    return null;
  }
}

class DetailPost extends StatefulWidget {
  final PostModel propriedade;

  const DetailPost({super.key, required this.propriedade});

  @override
  State<DetailPost> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  PostModel get propriedade => widget.propriedade;

  @override
  Widget build(BuildContext context) {
    final comunidade = buscarComunidade(propriedade.comunidadeId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.fundo,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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
                          comunidade?.nome ?? "Comunidade",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(widget.propriedade.autor),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 1.8,
                              backgroundColor: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text(widget.propriedade.tempo),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  widget.propriedade.titulo,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 5),
                if (propriedade.tipo.isNotEmpty) ...[
                  _buildTags(propriedade.tipo),
                  SizedBox(height: 5),
                ],
                if (propriedade.conteudo.isNotEmpty) ...[
                  Text(widget.propriedade.conteudo),
                  SizedBox(height: 5),
                ],
                if (propriedade.urlImagem.isNotEmpty) ...[
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
                if (propriedade.anexo) ...[
                  const AnexoCard(),
                  const SizedBox(height: 5),
                ],
                SizedBox(height: 8),
                InteracaoBar(
                  likes: propriedade.likes,
                  comentarios: propriedade.comentarios,
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
        return Cores.tagMaterial;
      case 'ajuda':
        return Cores.tagAjuda;
      case 'dúvida':
        return Cores.tagDuvida;
      case 'outros':
        return Cores.tagOutros;
      default:
        return Cores.tagDefault;
    }
  }
}
