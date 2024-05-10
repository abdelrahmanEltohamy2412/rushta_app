import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/model/storedata.dart';
import 'package:rushta_app/mytheme.dart';
import '../../model/productmodel.dart';
import '../../provider/provider.dart';
import '../firebase_utils/firebase_utils.dart';
import 'cart.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key, required this.productData, required this.storeData});

  static const routeName = 'orderScreen';
  ProductData productData;
  StoreData storeData;


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
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/img.png',
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .365,
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(color: MyTheme.whiteColor),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .11,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productData.pharamacyProduct ?? 'errrrorrr',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: MyTheme.blackColor,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child:
                                Text(
                                  '\$${productData.price ??
                                      'errrrorrr'}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: MyTheme.primaryColor,
                                  ),
                                ),
                              ),
                              const Column(
                                children: [
                                  Text(
                                    'غير متوفر ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red),
                                  )
                                ],
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * .01),
                Container(
                  decoration: BoxDecoration(color: MyTheme.whiteColor),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .089,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: MyTheme.primaryColor,
                          radius: 30,
                          child: Text(
                            ' ${listProvider.storeDataList[0].pharamacyName}',
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          ' ${listProvider.storeDataList[0].pharamacyName}',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(

                                    context: context, builder: (context) =>
                                      Container(
                                          child: Column(children: [
                                            Text(
                                              '${productData.LocationDetails ?? 'errrrorrr'}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: MyTheme.primaryColor,
                                              ),
                                            ),

                                          ],)
                                      ),

                                  );
                                }, icon: const Icon(Icons.location_pin)),
                            ElevatedButton(style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    MyTheme.primaryColor
                                )
                            ),
                                onPressed: () {},
                                child: Text('Follow',
                                  style: TextStyle(color: Colors.white),))
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * .01),
                Container(
                    decoration: BoxDecoration(color: MyTheme.whiteColor),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .353,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              maxLines: 15,
                              '${productData.productDescripition ??
                                  'errrrorrr'}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: MyTheme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * .01),
                Container(
                    decoration: BoxDecoration(color: MyTheme.whiteColor),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .2,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Details', style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: MyTheme.blackColor),),
                          Row(
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Condition', style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: MyTheme.grayColor),),
                                  SizedBox(height: 1.5,),
                                  Text('Price', style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: MyTheme.grayColor),),
                                  SizedBox(height: 1.5,),
                                  Text('Category', style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: MyTheme.grayColor),),
                                  SizedBox(height: 1.5,),
                                  Text('Location', style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: MyTheme.grayColor),),
                                  SizedBox(height: 1.5,),


                                ],
                              ),
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'غير متوفر',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: MyTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 1.5,),
                                  Text(
                                    '${productData.price ??
                                        'errrrorrr'}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: MyTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 1.5,),
                                  Text(
                                    '${productData.CategoryProduct ??
                                        'errrrorrr'}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: MyTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 1.5,),
                                  Text(
                                    '${productData.LocationDetails ??
                                        'errrrorrr'}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: MyTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 1.5,),


                                ],
                              ),

                            ],),

                        ],
                      ),
                    )
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * .01),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) =>
                                  CartScreen(productData: productData, storeData: storeData,)));
                          }
                          ,

                        
                        child: Text(
                          'add to cart',
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
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * .01),


              ],
            ),
          ),
        ),
      ),
    );
  }

  void showBottomSheet() {
  
  }
}
