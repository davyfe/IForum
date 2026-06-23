import 'package:iforum/domain/noticia_model.dart';
import 'db_helper.dart';

class NoticiaDao {
  Future<List<NoticiaModel>> listarTodos() async {
    final db = await DbHelper.database;
    final result = await db.query('NOTICIA', orderBy: 'id DESC');
    return result.map((json) => NoticiaModel.fromJson(json)).toList();
  }

  Future<NoticiaModel?> buscarPorId(int id) async {
    final db = await DbHelper.database;
    final result = await db.query(
      'NOTICIA',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) return null;
    return NoticiaModel.fromJson(result.first);
  }

  Future<int> inserir(NoticiaModel noticia) async {
    final db = await DbHelper.database;
    return db.insert('NOTICIA', {
      'titulo': noticia.titulo,
      'texto': noticia.texto,
      'urlImagem': noticia.urlImagem,
      'dataPub': noticia.dataPub,
      'tempo': noticia.tempo,
      'autor': noticia.autor,
      'portal': noticia.portal,
      'likes': noticia.likes,
      'comentarios': noticia.comentarios,
      'corTema': noticia.corTema,
    });
  }

  Future<int> deletar(int id) async {
    final db = await DbHelper.database;
    return db.delete('NOTICIA', where: 'id = ?', whereArgs: [id]);
  }
}
