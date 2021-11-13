import 'package:e_commerce_app/core/view_model/home_control_model.dart';
import 'package:e_commerce_app/view/product_details/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  // final List<String> categories = [
  //   'Men',
  //   'Women',
  //   'Devices',
  //   'Gadgets',
  //   'Gaming',
  // ];
  // final List<String> images = [
  //   'images/shoe.jpg',
  //   'images/heel.png',
  //   'images/devices.jpg',
  //   'images/gadget.jpg',
  //   'images/games.jpg',
  // ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      // init: Get.find(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Explore',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.green,
              ))
            : Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    _buildSearchBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildCategoryItem(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Best Selling',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 350, child: _buildCardItem()),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildCategoryItem() =>
      GetBuilder<HomeController>(builder: (controller) {
        return SizedBox(
          height: 90,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
              children: [
                // AspectRatio(
                //     aspectRatio: 1 / 1,
                //     child: Container(
                //         decoration: BoxDecoration(
                //             image: DecorationImage(
                //       fit: BoxFit.contain,
                //       image: AssetImage(
                //         images[index],
                //       ),
                //     )))),
                CircleAvatar(
                  foregroundColor: Colors.green,
                  radius: 25.0,
                  backgroundImage:
                      NetworkImage(controller.categoryModel[index].image),
                  // AssetImage(images[index]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.categoryModel[index].name,
                  // categories[index],
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            itemCount: controller.categoryModel.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 50,
            ),
          ),
        );
      });

  Widget _buildCardItem() => GetBuilder<HomeController>(
        builder: (controller) => ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Card(
            elevation: 0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductDetails(
                              model: controller.productModel[index],
                            )));
                // Get.to(ProductDetails(
                //   model: controller.productModel[index],
                // ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      controller.productModel[index].image,
                      height: 240,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      controller.productModel[index].name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        controller.productModel[index].description,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    controller.productModel[index].price,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.green,
                        fontWeight: FontWeight.w900),
                  ),
                  // const SizedBox(height: 200)
                ],
              ),
            ),
          ),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 10,
          ),
        ),
      );

  Widget _buildSearchBar() => TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.grey,
          prefixIcon: const Icon(
            Icons.search,
            size: 18,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: const BorderRadius.all(Radius.circular(
              25,
            )),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: const BorderRadius.all(Radius.circular(
              25,
            )),
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
      );
}
