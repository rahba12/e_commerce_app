import 'package:e_commerce_app/shared/extension/extension_color.dart';
import 'package:flutter/material.dart';

class ProductModel {
  late String image, name, price, description, size;
  late Color color;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.size,
    required this.image,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    image = json['image'];
    size = json['size'];
    price = json['price'];
    color = HexColor.fromHex(json['color']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'size': size,
      'description': description,
      'color': color,
      'price': price,
    };
  }
}
