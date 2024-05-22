import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rushta_app/Design/home/storeScreen/noStore.dart';
import 'package:rushta_app/Design/home/storeScreen/storeScreen.dart';
import 'package:rushta_app/mytheme.dart';

class NoProfileScreen extends StatelessWidget {
  const NoProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Store not Founded',
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
                  Navigator.pushNamed(context, StoreScreen.routeNAme);
                  },
                  child: Text(
                    'Add Store',
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
