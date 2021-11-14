import 'dart:core';

import 'package:e_commerce_app/core/services/database/cart_database_helper.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;

  CartController() {
    getAllProduct();
  }
  getAllProduct() async {
    try {
      _loading.value = true;
      var dbHelper = CartDatabaseHelper.db;
      _cartProductModel = await dbHelper.getAllProduct();
      print(_cartProductModel.length);
      _loading.value = false;
      getTotalPrice();
      update();
    } catch (error) {
      return Future.error(error);
    }
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    try {
      for (int i = 0; i < _cartProductModel.length; i++) {
        if (_cartProductModel[i].productId == cartProductModel.productId) {
          Get.snackbar(
              "Check your cart", "${cartProductModel.name} is already added");
          return;
        }
      }
      var dbHelper = CartDatabaseHelper.db;
      await dbHelper.insert(cartProductModel);
      _cartProductModel.add(cartProductModel);
      _totalPrice +=
          (double.parse(cartProductModel.price) * cartProductModel.quantity);
      update();
      Get.snackbar(
        "Item added",
        "${cartProductModel.name} was added to your cart",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Cannot add this item",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
      );
      debugPrint(e.toString());
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }
}
