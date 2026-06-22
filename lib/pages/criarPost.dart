import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/domain/post_model.dart';
import 'package:iforum/db/PostDao.dart';

class CriarPost extends StatefulWidget {
  const CriarPost({super.key});

  @override
  State<CriarPost> createState() => _CriarPostState();
}

class _CriarPostState extends State<CriarPost> {
  // controllers para ler o texto digitado
  final _tituloController = TextEditingController();
  final _conteudoController = TextEditingController();
  bool _salvando = false;

  @override
  void dispose() {
    // sempre limpar controllers
    _tituloController.dispose();
    _conteudoController.dispose();
    super.dispose();
  }

  Future<void> _postar() async {
    final titulo = _tituloController.text.trim();

    // validação mínima
    if (titulo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite um título para o post.')),
      );
      return;
    }

    setState(() => _salvando = true);

    final post = PostModel(
      titulo: titulo,
      autor: 'pdrolopes',
      // hardcoded por enquanto — virá do login futuramente
      comunidadeId: 1,
      // hardcoded — virá do seletor de comunidade
      tempo: 'agora',
      tipo: '',
      conteudo: _conteudoController.text.trim(),
    );

    await PostDao().inserir(post);

    setState(() => _salvando = false);

    if (mounted) {
      // volta para Home e avisa que criou um post (true)
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          _salvando
              ? const Padding(
                padding: EdgeInsets.only(right: 18),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              )
              : Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ElevatedButton(
                  onPressed: _postar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Cores.verdeifal,
                    shape: const StadiumBorder(),
                    elevation: 0,
                    minimumSize: const Size(0, 30),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                  ),
                  child: const Text(
                    'Postar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
        ],
        backgroundColor: Cores.fundo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenu(),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _tituloController, // agora tem controller
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Digite um título...',
                        hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      controller: _conteudoController, // agora tem controller
                      maxLines: null, // cresce conforme o texto
                      decoration: const InputDecoration(
                        hintText: 'Texto do post (opcional)',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black38,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            _buildBarraFormatacao(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      height: 35,
      padding: const EdgeInsets.only(left: 15, right: 8, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Selecionar Comunidade',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const Icon(Icons.unfold_more, color: Colors.black, size: 20),
        ],
      ),
    );
  }

  Widget _buildBarraFormatacao() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.format_bold, color: Colors.black),
        Icon(Icons.format_italic, color: Colors.black),
        Icon(Icons.format_underline, color: Colors.black),
        Icon(Icons.format_size, color: Colors.black),
        Icon(Icons.strikethrough_s, color: Colors.black),
        Icon(Icons.format_list_bulleted, color: Colors.black),
        Icon(Icons.link, color: Colors.black),
        Icon(Icons.attach_file, color: Colors.black),
        Icon(Icons.image, color: Colors.black),
        Icon(Icons.play_circle_filled, color: Colors.black),
      ],
    );
  }
}
