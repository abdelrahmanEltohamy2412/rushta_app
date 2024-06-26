import 'package:flutter/material.dart';
import 'package:rushta_app/Design/home/ordersScreen/orderScreen.dart';

import '../../../mytheme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .195,
      decoration: BoxDecoration(color: MyTheme.primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rushta',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, OrderScreenhistory.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Product',
                    hintStyle: TextStyle(
                      fontSize: 17,
                      color: MyTheme.grayColor,
                    ),
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: MyTheme.greenColor,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
