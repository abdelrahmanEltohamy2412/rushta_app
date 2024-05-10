import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../mytheme.dart';
import '../home/bottomNavigationBar.dart';


class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            height: MediaQuery.of(context).size.height * .116,
            decoration: BoxDecoration(
              color: MyTheme.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Status',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Image.asset('assets/images/img_2.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .07,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.primaryColor,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) =>
                        BottomNavigationBarScreen()));
                  }
                  ,


                  child: Text(
                    'Back TO Home'
                    ,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                        color: MyTheme.whiteColor,
                        fontWeight: FontWeight.w800),
                  )),
            ),
          ),
        ],),
      ),
    );
  }
}
