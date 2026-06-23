import 'package:iforum/domain/noticia_model.dart';
import 'db_helper.dart';

//a conexão do banco de dados

class NoticiaDao {
  //busca todas as noticias
  Future<List<NoticiaModel>> listarTodos() async {
    final db = await DbHelper.database;
    final result = await db.query('NOTICIA', orderBy: 'id DESC');

    //converte do banco de dados para dart
    return result.map((json) => NoticiaModel.fromJson(json)).toList();
  }

  //busca a noticia por numero id
  Future<NoticiaModel?> buscarPorId(int id) async {
    final db = await DbHelper.database;
    final result = await db.query(
      'NOTICIA',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    //se não achar nada no banco, retorna null
    if (result.isEmpty) return null;
    //se achar, pega o primeiro resultado e converte em objeto
    return NoticiaModel.fromJson(result.first);
  }

  Future<int> inserir(NoticiaModel noticia) async {
    final db = await DbHelper.database;
    return db.insert('NOTICIA', noticia.toMap());
  }

  Future<int> deletar(int id) async {
    final db = await DbHelper.database;
    return db.delete('NOTICIA', where: 'id = ?', whereArgs: [id]);
  }
}