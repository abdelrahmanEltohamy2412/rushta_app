
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/mytheme.dart';

import '../../../provider/provider.dart';


class ProductFounded extends StatefulWidget {
  const ProductFounded({super.key});

  @override
  State<ProductFounded> createState() => _ProductFoundedState();
}

class _ProductFoundedState extends State<ProductFounded> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    if (listProvider.productData.isEmpty) {
      listProvider.getDataProduct();
      listProvider.getDataStore();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height*.116,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: MyTheme.primaryColor ,
            ),
            child: const Center(
              child: Text('Order History ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
            ),

          ),
          Container(
            height: MediaQuery.of(context).size.height*.068,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,


            ),
            child: const Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Transactions', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black ,

                ),),

              ],),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.068,
          ),
          Container(
            height: MediaQuery.of(context).size.height*.12,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,


            ),
            child:  Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('${listProvider.images[1]}'),
                  SizedBox(width: 10,),
                  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Column(children: [
                      Text('${listProvider.productData[0].pharamacyProduct}', style: const TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14
                      ),),
                      Text('\$${listProvider.productData[0].price}', style:  TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color:MyTheme.primaryColor
                      ),),

                    ],),
                  ),
                  Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                  Container(
                    height: MediaQuery.of(context).size.height*.028,
                    width: MediaQuery.of(context).size.width*.28,
                    decoration: BoxDecoration(color: MyTheme.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))

                    ),
                    child: Center(
                      child: Text('Delivered', style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),),
                    ),
                  )



                ],),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.03,
          ),
          Container(
            height: MediaQuery.of(context).size.height*.12,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,


            ),
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('${listProvider.images[2]}'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Text('${listProvider.productData[1].pharamacyProduct}', style: const TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),),
                      Text('\$${listProvider.productData[1].price}', style: const TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14
                      ),),

                    ],),
                  ),
                  Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
                  Container(
                    height: MediaQuery.of(context).size.height*.028,
                    width: MediaQuery.of(context).size.width*.28,
                    decoration: BoxDecoration(color: MyTheme.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                            color: MyTheme.primaryColor,
                            width: 2
                        )

                    ),
                    child: Center(
                      child: Text('Order placed', style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.primaryColor
                      ),),
                    ),
                  )



                ],),
            ),
          ),
        ],),
      ),
    );
  }

}



