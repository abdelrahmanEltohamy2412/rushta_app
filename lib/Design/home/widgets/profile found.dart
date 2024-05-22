import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/mytheme.dart';

import '../../../provider/provider.dart';




class ProfileScreenFounded extends StatelessWidget {
  const ProfileScreenFounded({super.key});

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    if(listProvider.storeDataList.isEmpty){
      listProvider.getDataStore();
    }
    return Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: MyTheme.primaryColor),
                child: Padding
                  (
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                        child: CircleAvatar(

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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              ' ${listProvider.storeDataList[0].pharamacyName}',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ' ${listProvider.storeDataList[0].phoneNumber}',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ' ${listProvider.storeDataList[0].webAdress}',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontSize: 14),
                              textAlign: TextAlign.center,
                            ),


                          ],),
                      ),



                    ],),

                ),

              ),


              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [ SizedBox(height: MediaQuery.of(context).size.height*.1,),
                  Center(

                    child: Container(

                      height: MediaQuery.of(context).size.height * .37,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: const BoxDecoration(color: Colors.white
                          ,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              Divider(),
                              const Text(
                                'Language & Currency',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              Divider(),
                              const Text(
                                'Feedback',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              Divider(),
                              const Text(
                                'Refer a Friend',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              Divider(),
                              const Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              Divider(),
                              Text(
                                'Logout',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: MyTheme.primaryColor),
                              ),
                              Divider(),
                            ],
                          )),
                    ),
                  )],)


            ]));
  }
}
