import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return openDatabase(
      path,
      version: 3,
      onCreate: _onCreateDB,
      onUpgrade: _onUpgradeDB,
    );
  }

  static Future<void> _onCreateDB(Database db, int version) async {
    await _criarTabelaPost(db);
    await _criarTabelaUsuario(db);
    await _criarTabelaNoticia(db);
    await _seedPosts(db);
    await _seedUsuarios(db);
    await _seedNoticias(db);
  }

  static Future<void> _onUpgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _criarTabelaUsuario(db);
      await _seedUsuarios(db);
    }
    if (oldVersion < 3) {
      await _criarTabelaNoticia(db);
      await _seedNoticias(db);
    }
  }

  static Future<void> _criarTabelaPost(Database db) async {
    await db.execute('''
      CREATE TABLE PROPRIEDADE_POST (
        id           INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo       TEXT    NOT NULL,
        autor        TEXT    NOT NULL,
        comunidadeId INTEGER,
        tempo        TEXT,
        tipo         TEXT,
        conteudo     TEXT,
        likes        INTEGER DEFAULT 0,
        comentarios  INTEGER DEFAULT 0,
        urlImagem    TEXT,
        anexo        INTEGER DEFAULT 0
      )
    ''');
  }

  static Future<void> _criarTabelaUsuario(Database db) async {
    await db.execute('''
      CREATE TABLE USUARIO (
        id         INTEGER PRIMARY KEY AUTOINCREMENT,
        nome       TEXT    NOT NULL,
        username   TEXT    NOT NULL UNIQUE,
        bio        TEXT    DEFAULT '',
        curso      TEXT    DEFAULT '',
        campus     TEXT    DEFAULT '',
        seguidores INTEGER DEFAULT 0,
        seguindo   INTEGER DEFAULT 0
      )
    ''');
  }

  static Future<void> _criarTabelaNoticia(Database db) async {
    await db.execute('''
      CREATE TABLE NOTICIA (
        id          INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo      TEXT    NOT NULL,
        texto       TEXT    NOT NULL,
        urlImagem   TEXT    DEFAULT '',
        dataPub     TEXT    DEFAULT '',
        tempo       TEXT    DEFAULT '',
        autor       TEXT    NOT NULL,
        portal      TEXT    DEFAULT '',
        likes       INTEGER DEFAULT 0,
        comentarios INTEGER DEFAULT 0,
        corTema     TEXT    DEFAULT '#006b3f'
      )
    ''');
  }

  static Future<void> _seedPosts(Database db) async {
    final posts = [
      {
        'titulo': 'Estou fazendo uma reformulação da minha tela em dart! :P',
        'autor': 'davyf',
        'comunidadeId': 1,
        'tempo': '30m',
        'tipo': 'Material',
        'conteudo': 'Recentemente fiz uma tela para apresentação de Programação Móvel, na terça-feira passada, funcionou bem, porém o design me incomodou um pouco. Por isso, agora estou a reformulando, melhorando aspectos tanto do design quando do código.',
        'likes': 26,
        'comentarios': 5,
      },
      {
        'titulo': 'Rio de Janeiro, RJ, Brasil.',
        'autor': 'pdrolopesm',
        'comunidadeId': 6,
        'tempo': '1d',
        'tipo': 'outros',
        'likes': 504,
        'comentarios': 230,
        'urlImagem': 'https://www.daninoce.com.br/wp-content/uploads/2017/07/9-vistas-incriveis-no-rio-de-janeiro-danielle-noce-imagem-destaque.jpg',
      },
      {
        'titulo': 'Achei esse livro fantástico pra ajudar nos estudos!',
        'autor': 'sabynna.louyse',
        'comunidadeId': 3,
        'tempo': '1h',
        'tipo': 'material',
        'likes': 60,
        'comentarios': 3,
        'anexo': 1,
      },
      {
        'titulo': 'Meu computador não está funcionando... Alguém sabe o que pode ser?',
        'autor': 'duarte.geh',
        'comunidadeId': 1,
        'tempo': '2s',
        'tipo': 'ajuda',
      },
    ];
    for (final post in posts) {
      await db.insert('PROPRIEDADE_POST', post);
    }
  }

  static Future<void> _seedUsuarios(Database db) async {
    final usuarios = [
      {
        'nome': 'Pedro Antonio',
        'username': 'pdrolopes',
        'bio': "'Não esquecer que por enquanto é tempo de morangos. Sim.' - Clarice Lispector, A Hora da Estrela.",
        'curso': 'Informática',
        'campus': 'Arapiraca',
        'seguidores': 27,
        'seguindo': 159,
      },
      {
        'nome': 'José Paulo',
        'username': 'jpaulo',
        'bio': 'Grêmio estudantil.',
        'curso': 'Informática',
        'campus': 'Arapiraca',
        'seguidores': 15,
        'seguindo': 50,
      },
    ];
    for (final u in usuarios) {
      await db.insert('USUARIO', u);
    }
  }

  static Future<void> _seedNoticias(Database db) async {
    final noticias = [
      {
        'titulo': 'Professor inova com novo método apresentado em sala.',
        'texto': 'O uso de ferramentas digitais e estratégias organizadas permite uma análise mais precisa dos hábitos de consumo, possibilitando identificar padrões, desperdícios e oportunidades de melhoria.',
        'urlImagem': 'https://img.freepik.com/fotos-gratis/professor-de-homem-usando-oculos-verificando-o-registro-de-classe-olhando-para-a-camera-intrigado-com-a-expressao-pensativa-pensando-sentado-na-mesa-da-escola-na-frente-do-quadro-negro-na-sala-aula_141793-131719.jpg',
        'dataPub': '18/05/2026',
        'tempo': '1d',
        'autor': 'Alaryce Jaylle',
        'portal': 'Ifal Notícias',
        'likes': 150,
        'comentarios': 5,
        'corTema': '#3F51B5',
      },
      {
        'titulo': 'Ordem e Disciplina: Dolores Umbridge é nomeada a primeira Alta Inquisidora de Hogwarts.',
        'texto': 'O Ministério da Magia tomou uma medida sem precedentes nesta manhã para garantir o rigor e o padrão de excellence na Escola de Magia e Bruxaria de Hogwarts.',
        'urlImagem': 'https://observatoriodocinema.com.br/wp-content/uploads/2023/12/dolores-umbridge-harry-potter-scaled.jpg',
        'dataPub': '08/09/1995',
        'tempo': '3h',
        'autor': 'Rita Skeeter',
        'portal': 'O Profeta Diário',
        'likes': 85,
        'comentarios': 12,
        'corTema': '#F06292',
      },
      {
        'titulo': 'Grêmio Estudantil divulga ação sobre a importância da participação ativa.',
        'texto': 'A ação promovida pelo Grêmio Estudantil teve como principal objetivo incentivar os alunos a participarem mais ativamente das decisões da escola.',
        'urlImagem': 'https://observatorio.movimentopelabase.org.br/wp-content/uploads/2022/07/shutterstock-1937721487-970x570.jpg',
        'dataPub': '15/05/2026',
        'tempo': '3d',
        'autor': 'José Paulo',
        'portal': 'gremio.if',
        'likes': 45,
        'comentarios': 20,
        'corTema': '#9C2F27',
      },
      {
        'titulo': 'A percepção das dificuldades promove uma abordagem mais crítica e inclusiva na realidade educacional.',
        'texto': 'Os estudos mais recentes relacionados ao ambiente escolar demonstram que compreender as dificuldades enfrentadas pelos estudantes é fundamental para criar um ambiente mais inclusivo.',
        'urlImagem': 'https://www.agricultura.sc.gov.br/wp-content/uploads/2024/06/WhatsApp-Image-2024-06-04-at-16.51.49.jpeg',
        'dataPub': '16/05/2026',
        'tempo': '2d',
        'autor': 'Adriana Santana',
        'portal': 'meio_ambiente_if',
        'likes': 55,
        'comentarios': 35,
        'corTema': '#006b3f',
      },
      {
        'titulo': 'Panorama sobre o universo dos jogos destaca seu papel no aprendizado.',
        'texto': 'Pesquisadores e educadores vêm discutindo cada vez mais a presença dos jogos digitais como ferramenta pedagógica nas escolas.',
        'urlImagem': 'https://cdn.focoradical.com.br/newfoco/banners/20251217173547IMG9373.jpg',
        'dataPub': '15/05/2026',
        'tempo': '3d',
        'autor': 'Karinne Coelho',
        'portal': 'jogos_if',
        'likes': 80,
        'comentarios': 50,
        'corTema': '#1F9A25',
      },
    ];
    for (final n in noticias) {
      await db.insert('NOTICIA', n);
    }
  }
}