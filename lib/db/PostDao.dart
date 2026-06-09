import 'package:iforum/domain/PropriedadePost.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class PostDao {
  Future<List<PropriedadePost>> listarPropriedades() async {
    Database db = await DbHelper().initDB();

    var result = await db.rawQuery('SELECT * FROM PROPRIEDADE_POST');

    List<PropriedadePost> lista = [];
    for (var json in result) {
      PropriedadePost propriedade = PropriedadePost.fromJson(json);
      lista.add(propriedade);
    }
    return lista;
  }
}
