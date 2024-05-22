import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider.dart';
import 'aftercreate.dart';
import 'noStore.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
   static const String routeNAme= 'storeScreen';
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context) ;
      if(listProvider.storeDataList.isEmpty){
        return  const NoStoreScreen();
      }else {
        return AfterCreate();
      }


  }
}
