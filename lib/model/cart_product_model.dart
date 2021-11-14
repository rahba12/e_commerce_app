import 'package:e_commerce_app/shared/extension/extension_color.dart';
import 'package:flutter/material.dart';

class CartProductModel {
  late String image, name, price, productId;
  late int quantity;

  CartProductModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.productId,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productId': productId,
    };
  }
}
