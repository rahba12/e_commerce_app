import 'package:e_commerce_app/core/view_model/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) => SizedBox(
                  height: 145,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                controller.cartProductModel[index].image)),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 240,
                                child: Text(
                                  controller.cartProductModel[index].name,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$${controller.cartProductModel[index].price.toString()}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                color: Colors.grey.shade300,
                                height:
                                    MediaQuery.of(context).size.height * 0.0331,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          4,
                                        ),
                                        color: Colors.green,
                                      ),
                                      child: IconButton(
                                        splashRadius: 20,
                                        color: Colors.grey,
                                        iconSize: 30,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Text(
                                      '0',
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          4,
                                        ),
                                        color: Colors.green,
                                      ),
                                      child: IconButton(
                                        splashRadius: 4,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      'TOTAL',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$1000',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700))),
                    onPressed: () {},
                    icon: const Icon(Icons.check),
                    label: const Text('CHECKOUT')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
