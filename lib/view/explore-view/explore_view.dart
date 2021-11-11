import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExploreView extends StatelessWidget {
  ExploreView({Key? key}) : super(key: key);

  final List<String> categories = [
    'Men',
    'Women',
    'Devices',
    'Gadgets',
    'Gaming',
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
          children: <Widget>[
            _buildSearchBar(),
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
            const SizedBox(
              height: 20,
            ),
            _buildCategoryItem(),
            const SizedBox(
              height: 30,
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
              height: 25,
            ),
            _buildCardItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem() => SizedBox(
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
                backgroundImage: AssetImage(images[index]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                categories[index],
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 50,
          ),
        ),
      );
  Widget _buildCardItem() => Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Card(
                  child: Image.asset(
                    'images/home.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                height: 240,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'BeoPlay Speaker',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'Bang and Olufsen',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                '700 LE',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 50,
          ),
        ),
      );
  Widget _buildSearchBar() => TextFormField(
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
