// ignore_for_file: avoid_print, unused_local_variable

import 'package:e_commerce_app/app_theme/theme_controller.dart';
import 'package:e_commerce_app/view/settings/settings.dart';
import 'package:e_commerce_app/view/shipping_address_view/shipping_address_view.dart';
import 'package:e_commerce_app/view/view_auth/login_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserView extends StatefulWidget {
  UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final controller = Get.put(ThemeController());

  removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return Scaffold(
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF42A34E)),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/image.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Text(
                        "Carla Mick",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        "https://protocoderspoint.com/",
                        style: Theme.of(context).textTheme.bodyText2,
                        // TextStyle(
                        //     fontSize: 12.0,
                        //     fontWeight: FontWeight.w500,
                        //     color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          ListTile(
              leading: const Icon(Icons.input),
              title: const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: .8,
                ),
              ),
              onTap: () => {}),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: .8,
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: .8,
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Settings())),
            },
          ),
          GetBuilder<ThemeController>(
            builder: (controller) => ListTile(
              leading: const Icon(Icons.brightness_4_outlined),
              title: const Text(
                'Night mode',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: .8,
                ),
              ),
              onTap: () {
                controller.toggleDarkMode();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: .8,
              ),
            ),
            onTap: () async {
              // remove userid
              removeUserId();
              String? userId = await removeUserId();
              print("User Id : $userId");
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const LoginAndRegister(),
                ),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ]),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF42A34E),
        title: const Text('User'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: ListView(
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('images/image.jpg'), fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Center(
              child: Text(
                'Rehab mohamed',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'rehab25@gmail.com',
              style: Theme.of(context).textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).iconTheme.color,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 3,
                      thickness: 2,
                      color: Colors.grey[300],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ShippingAddress()));
                    },
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Shipping Address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).iconTheme.color,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 3,
                      thickness: 2,
                      color: Colors.grey[300],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Order History',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).iconTheme.color,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 3,
                      thickness: 2,
                      color: Colors.grey[300],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Cards',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).iconTheme.color,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 3,
                      thickness: 2,
                      color: Colors.grey[300],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).iconTheme.color,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 3,
                      thickness: 2,
                      color: Colors.grey[300],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).iconTheme.color,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 3,
                      thickness: 2,
                      color: Colors.grey[300],
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
