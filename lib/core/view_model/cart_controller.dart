import 'dart:core';

import 'package:e_commerce_app/core/services/database/cart_database_helper.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartController() {
    getAllProduct();
  }
  getAllProduct() async {
    _loading.value = true;
    var dbhealper = CartDatabaseHelper.db;
    _cartProductModel = await dbhealper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbhealper = CartDatabaseHelper.db;
    await dbhealper.insert(cartProductModel);
    update();
  }
}
