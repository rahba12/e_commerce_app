import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(0, 197, 105, 1.0);

final String tableCartProduct = 'CartProduct';
final String columnName = 'name';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnQuantity = 'quantity';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
