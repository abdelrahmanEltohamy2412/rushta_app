import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/Design/home/widgets/customAppBAr.dart';
import 'package:rushta_app/Design/home/widgets/medicineItem.dart';

import '../../provider/provider.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context) ;
    if(listProvider.productData.isEmpty&&listProvider.storeDataList.isEmpty){
      listProvider.getDataProduct();
      listProvider.getDataStore();
    }
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          const CustomAppBar(),

        Expanded(

          child: GridView.builder(padding: EdgeInsets.all(12),


            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 12,
              mainAxisSpacing: 12, crossAxisCount: 2, childAspectRatio: .73

            ),itemCount: listProvider.productData.length,
            itemBuilder: (BuildContext context, int index) {
            return MedicineItem(imageString: listProvider.images[index],
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
