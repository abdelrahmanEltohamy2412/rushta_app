

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/Design/home/widgets/customAppBAr.dart';
import 'package:rushta_app/Design/home/widgets/medicineItem.dart';

import 'package:rushta_app/mytheme.dart';
import 'package:rushta_app/provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context) ;
    if(listProvider.productData.isEmpty&&listProvider.storeDataList.isEmpty){
      listProvider.getDataProduct();
      listProvider.getDataStore();
    }
    return SafeArea(
      child: Scaffold(
          body: SafeArea(
            child: 
            SingleChildScrollView(
              child: Column(children: [
               CustomAppBar(),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Products',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: MyTheme.blackColor, fontSize: 18),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: MyTheme.primaryColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          'see All',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
              
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*.28 ,
                    child: ListView.separated(itemBuilder: (context, index){
                      return MedicineItem(productData: listProvider.productData[index], storeData: listProvider.storeDataList[0],);},
                      itemCount: listProvider.productData.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: MediaQuery.of(context).size.width*.03 , );
                      },
              
              
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Product',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: MyTheme.blackColor, fontSize: 18),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: MyTheme.primaryColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          'see All',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
              
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*.28,
                    child: ListView.separated(itemBuilder: (context, index){
                      return MedicineItem(productData:
                      listProvider.productData[index], storeData: listProvider.storeDataList[0]
              
                        ,
              
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
              ],)
                       
              
              
                      ],
                    ),
            ),
          )),
    );
  }
}
