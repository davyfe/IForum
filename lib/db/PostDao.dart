import 'package:iforum/domain/post_model.dart';
import 'db_helper.dart';

class PostDao {
  Future<List<PostModel>> listarTodos() async {
    final db = await DbHelper.database;
    final result = await db.query('PROPRIEDADE_POST');
    return result.map((json) => PostModel.fromJson(json)).toList();
  }

  Future<int> inserir(PostModel post) async {
    final db = await DbHelper.database;
    return db.insert('PROPRIEDADE_POST', {
      'titulo': post.titulo,
      'autor': post.autor,
      'comunidadeId': post.comunidadeId,
      'tempo': post.tempo,
      'tipo': post.tipo,
      'conteudo': post.conteudo,
      'likes': post.likes,
      'comentarios': post.comentarios,
      'urlImagem': post.urlImagem,
      'anexo': post.anexo ? 1 : 0,
    });
  }

  Future<int> deletar(int id) async {
    final db = await DbHelper.database;
    return db.delete('PROPRIEDADE_POST', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<PostModel>> listarPorAutor(String autor) async {
    final db = await DbHelper.database;
    final result = await db.query(
      'PROPRIEDADE_POST',
      where: 'autor = ?',
      whereArgs: [autor],
    );
    return result.map((json) => PostModel.fromJson(json)).toList();
  }

}

