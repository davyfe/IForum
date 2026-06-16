import 'package:iforum/domain/post_model.dart';
// VOU DELETAR DEPOIS

class FakePosts {
  static List posts = [
    PostModel(
      titulo: 'Estou fazendo uma reformulação da minha tela em dart! :P',
      autor: 'davyf',
      comunidadeId: 1,
      tempo: '30m',
      tipo: 'Material',
      conteudo:
          'Recentemente fiz uma tela para apresentação de Programação Móvel, na terça-feira passada, funcionou bem, porém o design me incomodou um pouco. Por isso, agora estou a reformulando, melhorando aspectos tanto do design quando do código.',
      likes: 26,
      comentarios: 5,
    ),
    PostModel(
      titulo: 'Rio de Janeiro, RJ, Brasil.',
      autor: 'pdrolopesm',
      comunidadeId: 6,
      tempo: '1d',
      tipo: 'outros',
      likes: 504,
      comentarios: 230,
      urlImagem:
          'https://www.daninoce.com.br/wp-content/uploads/2017/07/9-vistas-incriveis-no-rio-de-janeiro-danielle-noce-imagem-destaque.jpg',
    ),
    PostModel(
      titulo: 'Achei esse livro fantástico pra ajudar nos estudos!',
      autor: 'sabynna.louyse',
      comunidadeId: 3,
      tempo: '1h',
      tipo: 'material',
      likes: 60,
      comentarios: 3,
      anexo: true,
    ),
    PostModel(
      titulo:
          'Meu computador não está funcionando... Alguém sabe o que pode ser?',
      autor: 'duarte.geh',
      comunidadeId: 1,
      tempo: '2s',
      tipo: 'ajuda',
    ),
  ];
}
