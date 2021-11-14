import 'dart:ui';
import 'package:e_commerce_app/core/view_model/cart_controller.dart';
import 'package:e_commerce_app/core/view_model/home_control_model.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.model}) : super(key: key);
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                Image.network(
                  model.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .25,
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                    iconTheme: const IconThemeData(color: Colors.black),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    softWrap: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        backgroundColor: Colors.grey.shade300,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        label: Row(
                          children: [
                            const Text(
                              'Size',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.size,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Chip(
                        backgroundColor: Colors.grey.shade300,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        label: Row(
                          children: [
                            const Text(
                              'Color',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: model.color,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Details',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.description,
                    style: const TextStyle(
                        height: 2.5,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    maxLines: 7,
                    softWrap: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'PRICE',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        model.price,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  GetBuilder<CartController>(
                    init: CartController(),
                    builder: (controller) => ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          textStyle: MaterialStateProperty.all(const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700))),
                      icon: const Icon(Icons.add),
                      label: const Text('Add'),
                      onPressed: () => controller.addProduct(
                        CartProductModel(
                          name: model.name,
                          quantity: 1,
                          price: model.price,
                          image: model.image,
                          productId: model.productId,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
