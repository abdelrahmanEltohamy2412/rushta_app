import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rushta_app/Design/home/storeScreen/storeScreen.dart';
import 'BrowsrScreen.dart';
import 'ProfileScreen.dart';
import 'homeScreen.dart';
import 'ordersScreen/orderScreen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
   BottomNavigationBarScreen({super.key});
  static const String routName = 'bottom_Screen';

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'browse'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'store'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'order history'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),

        ],
      ),
      body: tabs[selectedIndex],

    );

  }

  List<Widget> tabs = const[
     HomeScreen(),
     BrowseScreen(),
     StoreScreen(),
     OrderScreenhistory(),
     ProfileScreen(),

  ];


}
