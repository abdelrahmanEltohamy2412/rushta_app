import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:rushta_app/model/addressmodel.dart';
import 'package:rushta_app/model/storedata.dart';
import 'package:rushta_app/model/productmodel.dart';

import '../../../mytheme.dart';
import '../../../provider/provider.dart';
import '../../Addorder/orderScreen.dart';


class MedicineItem extends StatelessWidget {
   MedicineItem({super.key, required this.productData,required this.storeData,
   required this.imageString});
  ProductData productData ;
  StoreData storeData ;
   String imageString;



   @override
  Widget build(BuildContext context) {
     var listProvider = Provider.of<ListProvider>(context) ;
    return
      InkWell(
        onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c)=>OrderScreen(productData: productData, storeData: storeData,)));
        },
        child: Container(

        height:MediaQuery.of(context).size.height*.27 ,
        width:160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border(
             right: BorderSide(color: MyTheme.grayColor, width: .5),
            bottom: BorderSide(color: MyTheme.grayColor, width: .5),
            left:   BorderSide(color: MyTheme.grayColor, width: .5),



          )


        ),
        child: Column(
          children: [
             Image.asset(imageString,height: MediaQuery.of(context).size.height*.18,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(productData.pharamacyProduct??'errrrorrr', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: MyTheme.grayColor,

                  ),),


                ],),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

              child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(storeData.pharamacyName??'errrrrr', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: MyTheme.grayColor,

                  ),),
                  Text('\$ ${productData.offerPrice??'errrrorrr'}', style: TextStyle(
                    decoration: TextDecoration.lineThrough, decorationColor: Colors.grey, decorationThickness: 3.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: MyTheme.blackColor,

                  ),),
                  Text('\$ ${productData.price??'errrrorrr'}', style: TextStyle(

                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: MyTheme.primaryColor,

                  ),),

                ],),
            ),

          ],
        ),
            ),
      );/////////medcine iteem<<<<<<<<

  }

   String? printImage(images) {




   }
}
