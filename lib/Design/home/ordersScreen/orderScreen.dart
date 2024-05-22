
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/Design/home/ordersScreen/noProductScreen.dart';
import 'package:rushta_app/Design/home/ordersScreen/productFounded.dart';
import 'package:rushta_app/mytheme.dart';

import '../../../provider/provider.dart';


class OrderScreenhistory extends StatefulWidget {
  const OrderScreenhistory({super.key});
  static const String routeName = ' order';

  @override
  State<OrderScreenhistory> createState() => _OrderScreenhistoryState();
}

class _OrderScreenhistoryState extends State<OrderScreenhistory> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context) ;
    if(listProvider.productData.isEmpty){
      return  const NoProductScreen();
    }else {
      return ProductFounded();

  }

}


  }
