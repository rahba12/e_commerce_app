import 'package:e_commerce_app/shared/extension/extension_color.dart';
import 'package:flutter/material.dart';

class CartProductModel {
  late String image, name, price;
  late int quantity;

  CartProductModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
