
import 'package:flutter/material.dart';
import 'package:rushta_app/Design/Addorder/tanks.dart';

import '../../model/productmodel.dart';
import '../../model/storedata.dart';
import '../../mytheme.dart';
import 'addAdrees.dart';


class CartScreen extends StatefulWidget {
  CartScreen({
    super.key,
    required this.productData,
    required this.storeData,
  });

  static const routeNAme = 'cartScreen';
  ProductData productData;
  StoreData storeData;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> numbers = [1, 2, 3, 4];

  // Option 2
  int? NumbersOfMEd;

  // Option 2
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .117,
              decoration: BoxDecoration(
                color: MyTheme.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Order',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c) =>
                  AddAddress()));
            },
              child: Container(
                height: MediaQuery.of(context).size.height * .052,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Add address',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Container(
              height: MediaQuery.of(context).size.height * .23,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/img.png',
                          height: MediaQuery.of(context).size.height * .15,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * .05),
                        Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.productData.pharamacyProduct ?? 'errrrorrr',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: MyTheme.blackColor,
                              ),
                            ),
                            Text(
                              '\$${widget.productData.price ?? 'errrrorrr'}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: MyTheme.primaryColor,
                              ),
                            ),
                            Row(
                              children: [
                                const Text('Qty:'),
                                DropdownButton(

                                  // Not necessary for Option 1
                                  value: NumbersOfMEd,
                                  onChanged: (newValue) {
                                    setState(() {
                                      NumbersOfMEd = newValue;
                                    });
                                  },
                                  items: numbers.map((numbers) {
                                    return DropdownMenuItem(
                                      value: numbers,
                                      child: Text('$numbers'),
                                    );
                                  }).toList(),
                                ),
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                    const Divider(),
                    Text(
                      'Remove ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.grayColor),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Container(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Price Details', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black
                  ),),
                    SizedBox(height: MediaQuery.of(context).size.height * .02),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text('Price ( 1 item)', style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black
                      ),),
                      Text(
                        '\$${widget.productData.price ?? 'errrrorrr'}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: MyTheme.primaryColor,
                        ),
                      ),
                    ],),
                    SizedBox(height: MediaQuery.of(context).size.height * .01),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text('Delivery Fee', style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black
                      ),),
                      Text(
                        'Info',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: MyTheme.primaryColor,
                        ),
                      ),
                    ],),
                    const Divider(),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Amount', style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black
                        ),),
                        Text(
                          '\$${widget.productData.price ?? 'errrrorrr'}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: MyTheme.primaryColor,
                          ),
                        ),
                      ],),


                ],),
              )
            ),
            const Expanded(child: SizedBox()),

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
                            ThanksScreen()));
                    }
                    ,


                    child: Text(
                      'confirm order'
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


          ],
        ),
      ),
    );
  }
}
