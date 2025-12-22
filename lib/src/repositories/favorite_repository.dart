import 'package:crypto_app/src/core/utils/api_result.dart';
import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:crypto_app/src/repositories/database/db.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteRepository {
  Future<ApiResult<CryptoModel>> getById({required String id}) async {
    final db = await Db.connection();

    var response = await db.query(
      'favorite_cryptos',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (response.isNotEmpty) {
      var cryptoFounded = Map<String, dynamic>.from(response.first);

      var task = CryptoModel.fromMap(cryptoFounded);

      return ApiResult(data: task);
    }

    return ApiResult(
      message: "Não foi possível buscar esta tarefa. Tente novamente",
      isError: true,
    );
  }

  Future<ApiResult<List<CryptoModel>>> getAll() async {
    final db = await Db.connection();

    var cryptos = await db.query(
      'favorite_cryptos',
      orderBy: 'ID DESC',
    );

    if (cryptos.isNotEmpty) {
      List<CryptoModel> listTasks = CryptoModel.fromList(cryptos as List);
      return ApiResult(data: listTasks);
    }

    String message = "Não foi possível buscar suas cryptomoedas favoritas. Tente novamente!";
    return ApiResult<List<CryptoModel>>(message: message, isError: true);
  }

  Future<ApiResult<bool>> insert({required CryptoModel model}) async {
    final db = await Db.connection();

    var saved = await db.insert(
      'favorite_cryptos',
      {
        'id': model.id,
        'name': model.name,
        'symbol': model.symbol,
        'image': model.image,
        'is_favorite': 1,
        'created_at': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    if (saved > 0) {
      return ApiResult<bool>(
          data: true, message: "Cryptomoeda adicionada como favorita!");
    }

    return ApiResult<bool>(
      data: false,
      message: "Não foi possível cadastrar a tarefa. Tente novamente!",
      isError: true,
    );
  }

  Future<int> remove(String cryptoId) async {
    final db = await Db.connection();

    final deleted = await db
        .delete('favorite_cryptos', where: 'id = ?', whereArgs: [cryptoId]);

    return deleted;
  }
}
