import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  ExploreView({Key? key}) : super(key: key);

  final List<String> categories = [
    'Men',
    'Women',
    'Devices',
    'Gadgets'
        ' Gaming',
  ];
  final List<String> images = [
    'images/shoe.jpg',
    'images/heel.png',
    'images/devices.jpg',
    'images/gadget.jpg',
    'images/games.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
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
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                itemBuilder: (context, index) => AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        images[index],
                      ),
                    )))),
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
