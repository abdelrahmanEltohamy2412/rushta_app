

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/Design/home/storeScreen/viewProfileScreen.dart';

import 'package:rushta_app/model/storedata.dart';

import 'package:rushta_app/provider/provider.dart';

import '../../../mytheme.dart';
import '../../firebase_utils/firebase_utils.dart';
import 'Addproduct.dart';
import 'createStore.dart';


class AfterCreate extends StatefulWidget {


  AfterCreate({super.key, }) ;
  static const String routeName = 'afterCreate';

  @override
  State<AfterCreate> createState() => _AfterCreateState();
}

class _AfterCreateState extends State<AfterCreate> {
   StoreData ?storeData ;

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    if(listProvider.storeDataList.isEmpty){
      listProvider.getDataStore();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                height: MediaQuery.of(context).size.height * .25,
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
                        InkWell(onTap: (){
                          Navigator.pushNamed(context, ViewProfileScreen.routeName);
                        },
                          child: Container(
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
                        ),
                      ],
                    ),
                    const Divider(),
                    TextButton(
                    onPressed: () {
                      FireBaseUtils.deleteStore(storeData!).timeout(Duration(microseconds: 500), onTimeout: (){
                        print('deleteeeeeeeeeeeeeeeeeeeeee');
                        listProvider.getDataStore();

                      });
                      },
                    child: Text(  'Remove Store',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.grayColor),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              const Text(
                'You dont have product',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                height: MediaQuery.of(context).size.height * .07,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                          side:
                              BorderSide(color: MyTheme.primaryColor, width: 1)),
                      backgroundColor: Colors.white.withOpacity(.9),
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AddProduct.routeName);
                    },
                    child: Text(
                      'Add product ',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: MyTheme.primaryColor,fontWeight: FontWeight.w600,fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
  onpressed
      (){
    var listProvider = Provider.of<ListProvider>(context);
    if(listProvider.storeDataList.isNotEmpty){
      listProvider.storeDataList.removeAt(0);
    }
    setState(() {

    });
    return CreateStoreScreen();

  }
}
