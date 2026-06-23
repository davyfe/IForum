import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';
import 'package:iforum/widget/buildConfiguracao.dart';

class MenuConfig extends StatefulWidget {
  const MenuConfig({super.key});

  @override
  State<MenuConfig> createState() => _MenuConfigState();
}

class _MenuConfigState extends State<MenuConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.verdeifal,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildCabecalho("CONFIGURAÇÕES DA CONTA"),
          _buildPerfil(user: "sabynnalouyse"),
          BuildConfiguracao(
            icone: Icons.email_outlined,
            titulo: "Email",
            subtitulo: "sabynna@email.com",
          ),
          _buildCabecalho("OPÇÕES DE VISUALIZAÇÃO"),
          BuildConfiguracao(
            icone: Icons.view_agenda_outlined,
            titulo: "Visualização padrão",
            textoDireita: "Cartões",
          ),
          BuildConfiguracao(
            icone: Icons.image_outlined,
            titulo: "Miniaturas",
            textoDireita: "Padrão",
          ),
          _buildCabecalho("ACESSIBILIDADE"),
          BuildConfiguracao(
            icone: Icons.video_library_outlined,
            titulo: "Mídia e animações",
          ),
          BuildConfiguracao(
            icone: Icons.text_fields_outlined,
            titulo: "Tamanho do texto",
          ),
          BuildConfiguracao(icone: Icons.palette_outlined, titulo: "Aparência"),
          _buildCabecalho("SOBRE"),
          BuildConfiguracao(
            icone: Icons.article_outlined,
            titulo: "Regras do app",
          ),
          BuildConfiguracao(
            icone: Icons.key,
            titulo: "Política de privacidade",
          ),
          BuildConfiguracao(
            icone: Icons.help_outline,
            titulo: "Central de Ajuda",
          ),
          BuildConfiguracao(icone: Icons.logout_outlined, titulo: "Sair"),
          BuildConfiguracao(
            icone: Icons.delete_outline_outlined,
            titulo: "Apagar conta",
            color: Colors.red,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCabecalho(String titulo) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 24),
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
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      visualDensity: VisualDensity.compact,
      leading: CircleAvatar(backgroundColor: Color(0xFF8C9EFF), radius: 12),
      title: Text(
        "@$user",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}
