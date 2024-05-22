import 'package:flutter/material.dart';
import 'package:rushta_app/Design/home/storeScreen/Addproduct.dart';
import 'package:rushta_app/Design/home/storeScreen/aftercreate.dart';

import '../../../mytheme.dart';

class NoProductScreen extends StatelessWidget {
  const NoProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
                  'Product not Founded',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: MyTheme.primaryColor),
                )),
            SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.primaryColor,

                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AddProduct.routeName);
                  },
                  child: Text(
                    'Add product',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
