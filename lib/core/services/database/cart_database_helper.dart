import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:e_commerce_app/shared/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _datatbase;

  Future<Database?> get database async {
    if (_datatbase != null) return _datatbase;
    _datatbase = await intitDB();
  }

  intitDB() async {
    String path = join(await getDatabasesPath(), 'CartProductDb');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL, 
      $columnImage TEXT NOT NULL, 
      $columnPrice TEXT NOT NULL, 
      $columnQuantity INTEGER NOT NULL)
      ''');
    });
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map>? maps = await dbClient!.query(tableCartProduct);
    List<CartProductModel> list;
    if (maps.isNotEmpty) {
      list = maps.map((product) => CartProductModel.fromJson(product)).toList();
    } else {
      list = [];
    }
    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient!.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}