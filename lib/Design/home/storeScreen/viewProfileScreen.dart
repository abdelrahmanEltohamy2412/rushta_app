import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/mytheme.dart';

import '../../../provider/provider.dart';
import '../widgets/medicineItem.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});
  static const String routeName = 'viewProfileScreen';

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    if(listProvider.storeDataList.isEmpty){
      listProvider.getDataStore();

    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        body: Column(
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
                  ' ${listProvider.storeDataList[0].pharamacyName}',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      ' ${listProvider.storeDataList[0].pharamacyName}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    )

                ],),
              ),
              Text(
                ' ${listProvider.storeDataList[0].storeDescripiton}',
                style: TextStyle(
                  fontWeight: FontWeight.w500 ,
                  fontSize: 14,
                  color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),

            ],),
          ) ,
            SizedBox(height: 20,),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child:  Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(children: [
                      Text('Total Followers ',  style: TextStyle(
                          fontWeight: FontWeight.w500 ,
                          fontSize: 14,
                          color: Colors.black
                      ),),
                      Text('0',  style: TextStyle(
                          fontWeight: FontWeight.w500 ,
                          fontSize: 14,
                          color: Colors.black
                      ),),

                    ],),
                    Column(
                      children: [
                        const Text(
                          'Total Products ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        Text(
                          ' ${listProvider.productData.length}' ,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(

              child: GridView.builder(padding: EdgeInsets.all(12),


                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12, crossAxisCount: 2, childAspectRatio: .73

                ),itemCount: listProvider.productData.length,
                itemBuilder: (BuildContext context, int index) {
                  return MedicineItem(
                    productData: listProvider.productData[index], storeData: listProvider.storeDataList[0],



                  );

                },

              ),
            )



        ],),
      ),
    );
  }
}
