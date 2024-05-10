import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rushta_app/model/storedata.dart';

import '../../../model/productmodel.dart';
import '../../../mytheme.dart';


class ProductsOfPharmacy extends StatelessWidget {
  ProductsOfPharmacy({super.key, required this.productData, required this.storeData,});
  ProductData productData ;
  StoreData storeData ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:MediaQuery.of(context).size.height*.27 ,
      width:160,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border(
            right: BorderSide(color: MyTheme.grayColor, width: .5),
            bottom: BorderSide(color: MyTheme.grayColor, width: .5),
            left: BorderSide(color: MyTheme.grayColor, width: .5),



          )


      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/img.png'),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(productData.pharamacyProduct??'errrrorrr', style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: MyTheme.grayColor,

            ),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Row(
              children: [
                Text(storeData.pharamacyName??'errrrrr', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: MyTheme.grayColor,

                ),),

                Text(
                  productData.offerPrice??'', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: MyTheme.primaryColor,

                ),),const SizedBox(width: 30,),
                Text(productData.price??'errrrorrr', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: MyTheme.primaryColor,

                ),),

              ],),
          ),

        ],
      ),
    );
  }
}
