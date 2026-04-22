import 'package:flutter/material.dart';

class Configuracoes extends StatefulWidget{
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        title: Text(
          'Configurações',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildCabecalho("CONFIGURAÇÕES DA CONTA"),
          _buildPerfil(user: "sabynnalouyse"),
          _buildConfiguracao(icone: Icons.email, titulo: "Email", subtitulo: "sabynna@email.com"),
          _buildCabecalho("OPÇÕES DE VISUALIZAÇÃO"),
          _buildConfiguracaoComTexto(icone: Icons.view_agenda_outlined, titulo: "Visualização padrão", textoDireita: "Cartões"),
          _buildConfiguracaoComTexto(icone: Icons.image_outlined, titulo: "Miniaturas", textoDireita: "Padrão"),
          _buildCabecalho("ACESSIBILIDADE"),
          _buildConfiguracao(icone: Icons.video_library_outlined, titulo: "Mídia e animações"),
          _buildConfiguracao(icone: Icons.text_fields_outlined, titulo: "Tamanho do texto"),
          _buildConfiguracao(icone: Icons.palette_outlined, titulo: "Aparência"),
          _buildCabecalho("SOBRE"),
          _buildConfiguracao(icone: Icons.article_outlined, titulo: "Regras do app"),
          _buildConfiguracao(icone: Icons.key, titulo: "Política de privacidade"),
          _buildConfiguracao(icone: Icons.help_outline, titulo: "Central de Ajuda"),
          _buildConfiguracao(icone: Icons.logout_outlined, titulo: "Sair"),
          _buildConfiguracaoVermelho(icone: Icons.delete_outline_outlined, titulo: "Apagar conta"),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCabecalho(String titulo){
    return Padding(
      padding: EdgeInsets.only(left: 30, top:24) ,
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        )
      ),
    );
  }

  //O required pede que após a variável coloquemos o valor daquela variável. Ex.: nome: "Davy"
  Widget _buildPerfil({required String user}){
    //Uma lista que ao ser clicada leva para uma outra página.
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      visualDensity: VisualDensity.compact,
      leading: CircleAvatar(
        backgroundColor: Color(0xFF8C9EFF),
        radius: 12,
      ),
      title: Text(
        "@$user",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      //Setinha do ListTile
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: (){}
    );
  }

  Widget _buildConfiguracao({required IconData icone, required String titulo, String subtitulo=""}){
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      visualDensity: VisualDensity.compact,
      leading: Icon(
        icone,
        color: Colors.black87,
        size: 26,
      ),
      title: Text(
        titulo,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        )
      ),
      //O isnotempty é uma forma resumida de fazer o IF. Ex.: subtitulo.isNotEmpy = "se o subtitulo não estiver vazio, faça:
      subtitle: subtitulo.isNotEmpty
        ? Text(subtitulo, style: TextStyle(color: Colors.grey[600], fontSize: 13))
        : null,
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: (){}
    );
  }

  Widget _buildConfiguracaoVermelho({required IconData icone, required String titulo, String subtitulo=""}){
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 30),
        visualDensity: VisualDensity.compact,
        leading: Icon(
          icone,
          color: Colors.red,
          size: 26,
        ),
        title: Text(
            titulo,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.red
            )
        ),
        //O isnotempty é uma forma resumida de fazer o IF. Ex.: subtitulo.isNotEmpy = "se o subtitulo não estiver vazio, faça:
        subtitle: subtitulo.isNotEmpty
            ? Text(subtitulo, style: TextStyle(color: Colors.grey[600], fontSize: 13))
            : null,
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.red,
        ),
        onTap: (){}
    );
  }


  // configuração com texto à direita (ex: Cartões, Padrão)
  Widget _buildConfiguracaoComTexto({
    required IconData icone,
    required String titulo,
    required String textoDireita,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      visualDensity: VisualDensity.compact,
      leading: Icon(icone, color: Colors.black87, size: 26),
      title: Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textoDireita,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
          SizedBox(width: 4),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
      onTap: () {},
    );
  }
}