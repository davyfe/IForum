import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/widget/buildConfiguracao.dart';

// objeto item
class _ItemConfig {
  final IconData icone;
  final String titulo;
  final String subtitulo;
  final String textoDireita;
  final Color color;

  const _ItemConfig({
    required this.icone,
    required this.titulo,
    this.subtitulo = '',
    this.textoDireita = '',
    this.color = Colors.black87,
  });
}

// objeto sessao (cabeçalho+item)
class _Secao {
  final String cabecalho;
  final List<_ItemConfig> itens;

  const _Secao({required this.cabecalho, required this.itens});
}

class MenuConfig extends StatefulWidget {
  const MenuConfig({super.key});

  @override
  State<MenuConfig> createState() => _MenuConfigState();
}

class _MenuConfigState extends State<MenuConfig> {
  // lista com cada sessao e seus itens
  static const List<_Secao> _secoes = [
    _Secao(
      cabecalho: 'CONFIGURAÇÕES DA CONTA',
      itens: [
        _ItemConfig(
          icone: Icons.email_outlined,
          titulo: 'Email',
          subtitulo: 'sabynna@email.com',
        ),
      ],
    ),
    _Secao(
      cabecalho: 'OPÇÕES DE VISUALIZAÇÃO',
      itens: [
        _ItemConfig(
          icone: Icons.view_agenda_outlined,
          titulo: 'Visualização padrão',
          textoDireita: 'Cartões',
        ),
        _ItemConfig(
          icone: Icons.image_outlined,
          titulo: 'Miniaturas',
          textoDireita: 'Padrão',
        ),
      ],
    ),
    _Secao(
      cabecalho: 'ACESSIBILIDADE',
      itens: [
        _ItemConfig(
          icone: Icons.video_library_outlined,
          titulo: 'Mídia e animações',
        ),
        _ItemConfig(
          icone: Icons.text_fields_outlined,
          titulo: 'Tamanho do texto',
        ),
        _ItemConfig(icone: Icons.palette_outlined, titulo: 'Aparência'),
      ],
    ),
    _Secao(
      cabecalho: 'SOBRE',
      itens: [
        _ItemConfig(icone: Icons.article_outlined, titulo: 'Regras do app'),
        _ItemConfig(icone: Icons.key, titulo: 'Política de privacidade'),
        _ItemConfig(icone: Icons.help_outline, titulo: 'Central de Ajuda'),
        _ItemConfig(icone: Icons.logout_outlined, titulo: 'Sair'),
        _ItemConfig(
          icone: Icons.delete_outline_outlined,
          titulo: 'Apagar conta',
          color: Colors.red,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.verdeifal,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      // for(i=0; i<item.lendh, i++)
      body: ListView.builder(
        itemCount: _contarItens(),
        itemBuilder: (context, i) => _buildItem(i),
      ),
    );
  }

  // conta quantos itens tem
  int _contarItens() {
    int total = 1;
    for (final secao in _secoes) {
      total += 1 + secao.itens.length;
    }
    total += 1;
    return total;
  }

  Widget _buildItem(int index) {
    if (index == 0) {
      return _buildPerfil(user: 'sabynnalouyse');
    }

    int cursor = 1;
    for (final secao in _secoes) {
      if (index == cursor) {
        return _buildCabecalho(secao.cabecalho);
      }

      cursor++;

      for (final item in secao.itens) {
        // verifica se o índice pedido é este item
        if (index == cursor) {
          return BuildConfiguracao(
            icone: item.icone,
            titulo: item.titulo,
            subtitulo: item.subtitulo,
            textoDireita: item.textoDireita,
            color: item.color,
          );
        }

        cursor++;
      }
    }
    return const SizedBox(height: 30);
  }

  Widget _buildCabecalho(String titulo) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 24),
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildPerfil({required String user}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      visualDensity: VisualDensity.compact,
      leading: const CircleAvatar(
        backgroundColor: Color(0xFF8C9EFF),
        radius: 12,
      ),
      title: Text(
        '@$user',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}
