import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/comunidade_model.dart';

class SecaoTopicos extends StatelessWidget {
  final List<String> topicos;

  const SecaoTopicos({super.key, required this.topicos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        spacing: 8, // espaço horizontal entre chips
        runSpacing: 8, // espaço vertical entre linhas
        children: topicos.map((t) => _buildChip(t)).toList(),
      ),
    );
  }

  Widget _buildChip(String texto) {
    return ActionChip(
      label: Text(texto, style: const TextStyle(fontWeight: FontWeight.w500)),
      backgroundColor: Cores.fundo,
      labelPadding: const EdgeInsets.only(left: 4, right: 2),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      onPressed: () {},
    );
  }
}

class ListaComunidades extends StatelessWidget {
  final List lista;

  const ListaComunidades({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true, // pra ter o tamanho do que tiver
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ComunidadeCard(propriedade: lista[index]);
          },
        ),
      ],
    );
  }
}

class ComunidadeCard extends StatelessWidget {
  final comunidadeModel propriedade;

  const ComunidadeCard({super.key, required this.propriedade});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black26, width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: propriedade.tema,
                ),
                Padding(
                  padding: const EdgeInsetsGeometry.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    top: 36,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            propriedade.nome,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.group,
                            color: Colors.grey.shade700,
                            size: 15,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "${propriedade.membros} mil membros",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // const Spacer(),
                          // ElevatedButton(
                          //   onPressed: (){},
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Cores.verdeifal,
                          //     shape: const StadiumBorder(),
                          //     elevation: 2, // 0
                          //     minimumSize: const Size(60, 30),
                          //     padding: const EdgeInsets.symmetric(horizontal: 16),
                          //   ),
                          //   child: const Text("Entrar",
                          //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ],
                      ),
                      //const SizedBox(height: 8),
                      Text(
                        propriedade.descricao,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black87,
                          height: 1.3,
                        ),
                      ),
                      // const SizedBox(height: 12),
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons.group,
                      //       color: Colors.grey.shade400,
                      //       size: 10,
                      //     ),
                      //     const SizedBox(width: 6),
                      //     Text(
                      //       "${propriedade.membros} membros",
                      //       style: TextStyle(
                      //         color: Colors.grey.shade700,
                      //         fontSize: 13,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 100 - 28,
              left: 16,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Cores.fundo,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(radius: 28, backgroundColor: Cores.avatar),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
