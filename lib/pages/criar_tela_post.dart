import 'package:flutter/material.dart';

class CriarPostTela extends StatefulWidget {
  const CriarPostTela({super.key});

  @override
  State<CriarPostTela> createState() => _CriarPostTelaState();
}

class _CriarPostTelaState extends State<CriarPostTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Define a cor de fundo cinza claro de toda a tela
      backgroundColor: const Color(0xFFD9D9D9),

      // 2. SafeArea impede que o layout fique escondido atrás da barra de status do celular
      body: SafeArea(
        // 3. SingleChildScrollView permite que a tela role quando o teclado abrir
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _construirCabecalho(),
              const SizedBox(height: 20), // Espaçamento

              _construirCampoTitulo(),
              const SizedBox(height: 20),

              _construirEditorPrincipal(),
              const SizedBox(height: 15),

              _construirBotoesAnexo(),
            ],
          ),
        ),
      ),
    );
  }

  // PASSO 1: CABEÇALHO (Botão X e Botão Postar)
  Widget _construirCabecalho() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Empurra um para cada lado
      children: [
        // Botão Vermelho de Fechar
        Container(
          decoration: BoxDecoration(
            color: Colors.red[700],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {}, // Ação de fechar a tela aqui
          ),
        ),

        // Botão Verde de Postar
        InkWell(
          onTap: () {}, // Ação de postar aqui
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50), // Verde
              borderRadius: BorderRadius.circular(25), // Deixa em formato de pílula
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: const Text(
              'Postar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }

  // PASSO 2: CAMPO DE TÍTULO
  Widget _construirCampoTitulo() {
    return const TextField(
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black54
      ),
      decoration: InputDecoration(
        hintText: 'Digite um título...',
        hintStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black26 // Cor cinza do texto fantasma
        ),
        border: InputBorder.none, // Remove a linha padrão de baixo do texto
      ),
    );
  }

  // PASSO 3: CAIXA BRANCA DO EDITOR
  Widget _construirEditorPrincipal() {
    return Container(
      height: 350, // Define a altura da caixa branca
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Expanded faz a área de texto ocupar todo o espaço que sobrar até os ícones
          Expanded(
            child: Stack(
              children: [
                // Campo de texto principal
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    maxLines: null, // Permite infinitas linhas
                    decoration: InputDecoration(
                      hintText: 'Texto do post (opcional)...',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Ícone de Diretrizes posicionado no canto superior direito
                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    children: [
                      Icon(Icons.campaign, color: Colors.red[700], size: 30),
                      Text(
                        'DIRETRIZES',
                        style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 9,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Barra de ícones de formatação no final da caixa branca
          _construirBarraFormatacao(),
        ],
      ),
    );
  }

  // PASSO 4: BARRA DE FORMATAÇÃO (Ícones)
  Widget _construirBarraFormatacao() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.format_bold, color: Colors.black),
          Icon(Icons.format_italic, color: Colors.black),
          Icon(Icons.link, color: Colors.black),
          Icon(Icons.format_underline, color: Colors.black),
          Icon(Icons.strikethrough_s, color: Colors.black),
          Text('Aa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // Usando texto em vez de ícone para o "Aa"
          Icon(Icons.format_list_bulleted, color: Colors.black),
          Icon(Icons.format_list_numbered, color: Colors.black),
          Icon(Icons.format_quote, color: Colors.black),
          Icon(Icons.image, color: Colors.black),
          Icon(Icons.play_circle_filled, color: Colors.black),
        ],
      ),
    );
  }

  // PASSO 5: BOTÕES INFERIORES DE ANEXO
  Widget _construirBotoesAnexo() {
    // SingleChildScrollView na horizontal para não dar erro se a tela do celular for pequena
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _construirBotaoAcao(Icons.note_add, 'Adicionar Anexo'),
          const SizedBox(width: 10),
          _construirBotaoAcao(Icons.link, 'Adicionar Link'),
          const SizedBox(width: 10),
          _construirBotaoAcao(Icons.image, 'Imagens & Vídeos'),
        ],
      ),
    );
  }

  // Função auxiliar para desenhar os botõezinhos brancos repetidos
  Widget _construirBotaoAcao(IconData icone, String texto) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icone, size: 18, color: Colors.black),
          const SizedBox(width: 6),
          Text(
            texto,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}
