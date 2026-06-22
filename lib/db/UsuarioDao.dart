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
    return db.insert('USUARIO', usuario.toMap());
  }

  Future<int> atualizar(UsuarioModel usuario) async {
    final db = await DbHelper.database;
    return db.update(
      'USUARIO',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

  Future<int> deletar(int id) async {
    final db = await DbHelper.database;
    return db.delete('USUARIO', where: 'id = ?', whereArgs: [id]);
  }
}