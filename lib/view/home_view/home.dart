import 'package:e_commerce_app/view/cart-view/cart_view.dart';
import 'package:e_commerce_app/view/explore-view/explore_view.dart';
import 'package:e_commerce_app/view/user-view/user_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      ExploreView(),
      const CartView(),
      UserView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Explore"),
        activeColorPrimary: CupertinoColors.systemGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesome5.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.systemOrange,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_pin),
        title: ("User"),
        activeColorPrimary: CupertinoColors.systemIndigo,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      popActionScreens: PopActionScreensType.all,
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
