import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/home_service/home_service.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  static HomeController get to => Get.find();

  // int _current = 0;
  // void setQuality( index) {
  //   _current = index;
  //   update();
  // }

  HomeController() {
    getCollection();
    getBestSellingProduct();
  }
  getCollection() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        // print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    }).catchError((error) {});
  }

  getBestSellingProduct() async {
    _loading.value = true;
    HomeService().getBestSellingProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        // print(_productModel.length);
        _loading.value = false;
      }
      update();
    }).catchError((error) {});
  }
}
