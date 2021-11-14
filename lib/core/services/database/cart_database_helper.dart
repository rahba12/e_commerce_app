import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:e_commerce_app/shared/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  Database? _datatbase;

  Future<Database?> get database async {
    if (_datatbase != null) return _datatbase;
    _datatbase = await createDatabase();
    return _datatbase;
  }

  Future createDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'CartProduct.db');
      return openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              '''CREATE TABLE IF NOT EXISTS $tableCartProduct ($columnName TEXT NOT NULL,$columnImage TEXT NOT NULL,$columnPrice TEXT NOT NULL,$columnQuantity INTEGER NOT NULL,$columnProductId INTEGER NOT NULL)''');
        },
      );
    } catch (error) {
      print("ERROR IN OPEN DATABASE $error");
      return Future.error(error);
    }
  }

  // void _onCreate(Database db, int newVersion) async {
  //
  //   var sql =
  //       'CREATE TABLE IF NOT EXISTS $tableCartProduct($columnName TEXT NOT NULL,$columnImage TEXT NOT NULL,$columnPrice TEXT NOT NULL,$columnQuantity INTEGER NOT NULL,$columnProductId TEXT NOT NULL)';
  //   await db?.execute(sql);
  // }

  Future<List<CartProductModel>> getAllProduct() async {
    try {
      var dbClient = await database;
      List<Map> maps = await dbClient!.query(tableCartProduct);
      List<CartProductModel> list;
      if (maps.isNotEmpty) {
        list =
            maps.map((product) => CartProductModel.fromJson(product)).toList();
      } else {
        list = [];
      }
      return list;
    } catch (error) {
      return Future.error(error);
    }
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient!.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient!.update(tableCartProduct, model.toJson(),
        where: 'columnProductId = ?', whereArgs: [model.productId]);
  }

  // Future close() async => db.close();
}
