import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rushta_app/Design/home/storeScreen/aftercreate.dart';
import 'package:rushta_app/Design/home/storeScreen/noStore.dart';
import 'package:rushta_app/Design/home/widgets/NoProfileFounded.dart';
import 'package:rushta_app/Design/home/widgets/profile%20found.dart';


import '../../provider/provider.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context) ;
    if(listProvider.storeDataList.isEmpty){
      return  const NoProfileScreen();
    }else {
      return ProfileScreenFounded();
    }

  }
}
