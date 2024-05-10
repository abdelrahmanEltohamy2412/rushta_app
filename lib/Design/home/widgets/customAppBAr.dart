
import 'package:flutter/material.dart';

import '../../../mytheme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.18,
      decoration: BoxDecoration(
          color: MyTheme.primaryColor
      ),child:
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row
            (mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Rushta',style: Theme.of(context).textTheme.titleLarge,),
            Row(
              children: [

                const Icon(Icons.favorite, color: Colors.white,),
                SizedBox(width: MediaQuery.of(context).size.width*.03, ),
                const Icon(Icons.shopping_cart, color: Colors.white,),

              ],

            ),
          ],),

          SizedBox(height: MediaQuery.of(context).size.height*.03,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)
            ),
            child: TextFormField(
              decoration:  InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Product' ,
                  hintStyle: TextStyle(
                    fontSize: 17,
                    color: MyTheme.grayColor ,

                  ),
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search,color: MyTheme.greenColor,)
              ),
            ),
          ),




        ],
      ),
    ),
    );
  }
}
