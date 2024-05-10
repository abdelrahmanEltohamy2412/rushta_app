import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/mytheme.dart';

import '../../../provider/provider.dart';

import '../bottomNavigationBar.dart';
import '../widgets/productofphara.dart';

class AfterAddProduct extends StatefulWidget {
  const AfterAddProduct({super.key});
  static const String routName = 'afterAddProduct' ;

  @override
  State<AfterAddProduct> createState() => _AfterAddProductState();
}

class _AfterAddProductState extends State<AfterAddProduct> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context) ;
    if(listProvider.productData.isEmpty && listProvider.storeDataList.isEmpty){
      listProvider.getDataProduct();
    }
    return  SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(backgroundColor: MyTheme.primaryColor,
            child: const Icon(Icons.home_filled,color: Colors.white,),

            onPressed: (){
                 Navigator.pushNamed(context, BottomNavigationBarScreen.routName);
            }),
        backgroundColor: MyTheme.scaffoldColor,
        body: SingleChildScrollView(
          child: Column(children: [
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .229,
              decoration: BoxDecoration(color: MyTheme.whiteColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
          
                    backgroundColor: MyTheme.primaryColor,
                    radius: 30,
          
                    child: Text(
                      ' ${listProvider.storeDataList[0].pharamacyName}',style:
                    const TextStyle(
                        fontSize:11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                      ,),
                  ),
                  Text(
                    '${listProvider.storeDataList[0].pharamacyName}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .40,
                        height: MediaQuery.of(context).size.height * .035,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: MyTheme.whiteColor,
                            border: Border.all(
                                color: MyTheme.primaryColor, width: 1.5)),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Edit Store',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: MyTheme.primaryColor),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .40,
                        height: MediaQuery.of(context).size.height * .035,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: MyTheme.primaryColor,
                            border: Border.all(
                                color: MyTheme.primaryColor, width: 1.5)),
                        child: Text(
                          textAlign: TextAlign.center,
                          'view Store',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: MyTheme.whiteColor),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    'Remove Store',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyTheme.grayColor),
                  ),
          
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.25 ,
                child: ListView.separated(itemBuilder: (context, index){
                  return ProductsOfPharmacy(productData:
                  listProvider.productData[index], storeData: listProvider.storeDataList[0],
          
                  );
                },
                  itemCount: listProvider.productData.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: MediaQuery.of(context).size.width*.03 , );
                  },
          
          
                ),
              ),
            ),
          
          ],),
        ),
      ),
    );
  }
}
