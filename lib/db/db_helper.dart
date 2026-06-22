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
    return openDatabase(path, version: 2, onCreate: _onCreateDB, onUpgrade: _onUpgradeDB);
    //                        ^^^^^^^^^ bumpar a versão para rodar onUpgrade
  }

  static Future<void> _onCreateDB(Database db, int version) async {
    await _criarTabelaPost(db);
    await _criarTabelaUsuario(db);
    await _seedPosts(db);
    await _seedUsuarios(db);
  }

  // onUpgrade roda quando o app já estava instalado com version: 1
  // e agora subiu para version: 2
  static Future<void> _onUpgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _criarTabelaUsuario(db);
      await _seedUsuarios(db);
    }
  }

  static Future<void> _criarTabelaPost(Database db) async {
    await db.execute('''
      CREATE TABLE PROPRIEDADE_POST (
        id          INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo      TEXT    NOT NULL,
        autor       TEXT    NOT NULL,
        comunidadeId INTEGER,
        tempo       TEXT,
        tipo        TEXT,
        conteudo    TEXT,
        likes       INTEGER DEFAULT 0,
        comentarios INTEGER DEFAULT 0,
        urlImagem   TEXT,
        anexo       INTEGER DEFAULT 0
      )
    ''');
  }

  static Future<void> _criarTabelaUsuario(Database db) async {
    await db.execute('''
      CREATE TABLE USUARIO (
        id          INTEGER PRIMARY KEY AUTOINCREMENT,
        nome        TEXT    NOT NULL,
        username    TEXT    NOT NULL UNIQUE,
        bio         TEXT    DEFAULT '',
        curso       TEXT    DEFAULT '',
        campus      TEXT    DEFAULT '',
        seguidores  INTEGER DEFAULT 0,
        seguindo    INTEGER DEFAULT 0
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
        'conteudo':
        'Recentemente fiz uma tela para apresentação de Programação Móvel, na terça-feira passada, funcionou bem, porém o design me incomodou um pouco. Por isso, agora estou a reformulando, melhorando aspectos tanto do design quando do código.',
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
        'urlImagem':
        'https://www.daninoce.com.br/wp-content/uploads/2017/07/9-vistas-incriveis-no-rio-de-janeiro-danielle-noce-imagem-destaque.jpg',
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
        'titulo':
        'Meu computador não está funcionando... Alguém sabe o que pode ser?',
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
        'bio':
        "'Não esquecer que por enquanto é tempo de morangos. Sim.'"
            " - Clarice Lispector, A Hora da Estrela.",
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
}