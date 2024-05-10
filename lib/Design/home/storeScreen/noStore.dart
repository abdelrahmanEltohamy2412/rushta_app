import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../mytheme.dart';
import 'createStore.dart';

class NoStoreScreen extends StatelessWidget {
  const NoStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              height: MediaQuery.of(context).size.height * .10,
              decoration: BoxDecoration(color: MyTheme.primaryColor),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Store',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .03,
                            ),
                            const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
            Image.asset('assets/images/img_1.png'),
            const Text('You Dont Have a Store', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            SizedBox(
              width:MediaQuery.of(context).size.width*.5,
              height: MediaQuery.of(context).size.height*.07 ,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    backgroundColor: MyTheme.primaryColor ,
                    padding: EdgeInsets.all(15),

                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, CreateStoreScreen.routeName);
                  }
                  ,
                  child: Text(
                    'Create Store',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: MyTheme.whiteColor,fontWeight: FontWeight.w800),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.25,)
          ],
        ),
      ),
    );
  }
}
