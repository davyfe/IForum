import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = "app.db";

    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);

    return db;
  }

  Future<void> onCreateDB(Database db, int version) async {
    String sqlPosts = '''CREATE TABLE PROPRIEDADE_POST ( 
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT NOT NULL,
      autor TEXT NOT NULL,
      comunidadeId INTEGER,
      tempo TEXT,
      tipo TEXT,
      conteudo TEXT,
      likes INTEGER DEFAULT 0,
      comentarios INTEGER DEFAULT 0,
      urlImagem TEXT,
      anexo INTEGER DEFAULT 0
    ); ''';

    await db.execute(sqlPosts);

    String sql =
        "INSERT INTO PROPRIEDADE_POST (titulo, autor, comunidadeId, tempo, tipo, conteudo, likes, comentarios) VALUES ('Estou fazendo uma reformulação da minha tela em dart! :P', 'davyf', 1, '30m', 'Material', 'Recentemente fiz uma tela para apresentação de Programação Móvel, na terça-feira passada, funcionou bem, porém o design me incomodou um pouco. Por isso, agora estou a reformulando, melhorando aspectos tanto do design quando do código.', 26, 5);";
    await db.execute(sql);

    sql =
    "INSERT INTO PROPRIEDADE_POST (titulo, autor, comunidadeId, tempo, tipo, likes, comentarios, urlImagem) VALUES ('Rio de Janeiro, RJ, Brasil.', 'pdrolopesm', 6, '1d', 'outros', 504, 230, 'https://www.daninoce.com.br/wp-content/uploads/2017/07/9-vistas-incriveis-no-rio-de-janeiro-danielle-noce-imagem-destaque.jpg');";
    await db.execute(sql);

    sql =
    "INSERT INTO PROPRIEDADE_POST (titulo, autor, comunidadeId, tempo, tipo, likes, comentarios, anexo) VALUES ('Achei esse livro fantástico pra ajudar nos estudos!', 'sabynna.louyse', 3, '1h', 'material', 60, 3, 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO PROPRIEDADE_POST (titulo, autor, comunidadeId, tempo, tipo) VALUES ('Meu computador não está funcionando... Alguém sabe o que pode ser?', 'duarte.geh', 1, '2s', 'ajuda');";
    await db.execute(sql);
  }
}
