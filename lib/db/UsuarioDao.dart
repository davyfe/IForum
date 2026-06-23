import 'package:iforum/domain/usuario_model.dart';
import 'db_helper.dart';

class UsuarioDao {
  Future<List<UsuarioModel>> listarTodos() async {
    final db = await DbHelper.database;
    final result = await db.query('USUARIO');
    return result.map((json) => UsuarioModel.fromJson(json)).toList();
  }

  Future<UsuarioModel?> buscarPorUsername(String username) async {
    final db = await DbHelper.database;
    final result = await db.query(
      'USUARIO',
      where: 'username = ?',
      whereArgs: [username],
      limit: 1,
    );
    if (result.isEmpty) return null;
    return UsuarioModel.fromJson(result.first);
  }

  Future<UsuarioModel?> buscarPorId(int id) async {
    final db = await DbHelper.database;
    final result = await db.query(
      'USUARIO',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) return null;
    return UsuarioModel.fromJson(result.first);
  }

  Future<int> inserir(UsuarioModel usuario) async {
    final db = await DbHelper.database;
    return db.insert('USUARIO', {
      'nome': usuario.nome,
      'username': usuario.username,
      'bio': usuario.bio,
      'curso': usuario.curso,
      'campus': usuario.campus,
      'seguidores': usuario.seguidores,
      'seguindo': usuario.seguindo,
    });
  }

  Future<int> atualizar(UsuarioModel usuario) async {
    final db = await DbHelper.database;
    return db.update(
      'USUARIO',
      {
        'nome': usuario.nome,
        'username': usuario.username,
        'bio': usuario.bio,
        'curso': usuario.curso,
        'campus': usuario.campus,
        'seguidores': usuario.seguidores,
        'seguindo': usuario.seguindo,
      },
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

  Future<int> deletar(int id) async {
    final db = await DbHelper.database;
    return db.delete('USUARIO', where: 'id = ?', whereArgs: [id]);
  }
}
