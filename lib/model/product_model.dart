import 'package:e_commerce_app/shared/extension/extension_color.dart';
import 'package:flutter/material.dart';

class ProductModel {
  late String image, name, price, description, size, productId;
  late Color color;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.size,
    required this.image,
    required this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    image = json['image'];
    size = json['size'];
    price = json['price'];
    color = HexColor.fromHex(json['color']);
    description = json['description'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'size': size,
      'description': description,
      'color': color,
      'price': price,
      'productId': productId,
    };
  }
}
