import 'package:flutter/material.dart';
import 'package:iforum/cores.dart';

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
          _buildConfiguracao(
            icone: Icons.email_outlined,
            titulo: "Email",
            subtitulo: "sabynna@email.com",
          ),
          _buildCabecalho("OPÇÕES DE VISUALIZAÇÃO"),
          _buildConfiguracaoComTexto(
            icone: Icons.view_agenda_outlined,
            titulo: "Visualização padrão",
            textoDireita: "Cartões",
          ),
          _buildConfiguracaoComTexto(
            icone: Icons.image_outlined,
            titulo: "Miniaturas",
            textoDireita: "Padrão",
          ),
          _buildCabecalho("ACESSIBILIDADE"),
          _buildConfiguracao(
            icone: Icons.video_library_outlined,
            titulo: "Mídia e animações",
          ),
          _buildConfiguracao(
            icone: Icons.text_fields_outlined,
            titulo: "Tamanho do texto",
          ),
          _buildConfiguracao(
            icone: Icons.palette_outlined,
            titulo: "Aparência",
          ),
          _buildCabecalho("SOBRE"),
          _buildConfiguracao(
            icone: Icons.article_outlined,
            titulo: "Regras do app",
          ),
          _buildConfiguracao(
            icone: Icons.key,
            titulo: "Política de privacidade",
          ),
          _buildConfiguracao(
            icone: Icons.help_outline,
            titulo: "Central de Ajuda",
          ),
          _buildConfiguracao(icone: Icons.logout_outlined, titulo: "Sair"),
          _buildConfiguracao(
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

  //O required pede que após a variável coloquemos o valor daquela variável. Ex.: nome: "Davy"
  Widget _buildPerfil({required String user}) {
    //Uma lista que ao ser clicada leva para uma outra página.
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      visualDensity: VisualDensity.compact,
      leading: CircleAvatar(backgroundColor: Color(0xFF8C9EFF), radius: 12),
      title: Text(
        "@$user",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      //Setinha do ListTile
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}
