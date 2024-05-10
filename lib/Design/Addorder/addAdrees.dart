import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:rushta_app/model/addressmodel.dart';
import 'package:rushta_app/mytheme.dart';

import '../../provider/provider.dart';
import '../firebase_utils/firebase_utils.dart';




class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  var formKey =GlobalKey<FormState>();
  String? name = ' ';

  String? phone = ' ';

  String? streetAddress = ' ';

  String? city = ' ';

  String? flat = ' ';

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.scaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .116,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyTheme.primaryColor,
                ),
                child: const Center(
                  child: Text(
                    'Add a New Address',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .065,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.my_location,
                      color: MyTheme.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Use Current Location ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: MyTheme.primaryColor),
                    )
                  ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Form(
                   key: formKey,
                   child: Column(children: [
                     TextFormField(
                       decoration: InputDecoration(
                           label: Text(
                             'Name',
                             style: TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: MyTheme.grayColor),
                           )),
                       validator: (text) {
                         if (text == null || text.isEmpty) {
                           return 'Name is required';
                         }
                         return null ;
                       },
                       onChanged: (text) {
                         name = text;
                       },
                     ),
                     TextFormField(
                       keyboardType: TextInputType.phone,
                       decoration: InputDecoration(
                           label: Text(
                             'phone',
                             style: TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: MyTheme.grayColor),
                           )),
                       validator: (text) {
                         if (text == null || text.isEmpty) {
                           return 'phone is required';
                         }  return null ;
                       },
                       onChanged: (text) {
                         phone = text;
                       },
                     ),
                     TextFormField(
                       decoration: InputDecoration(
                           label: Text(
                             'Street address',
                             style: TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: MyTheme.grayColor),
                           )),
                       validator: (text) {
                         if (text == null || text.isEmpty) {
                           return 'Street address is required';
                         }  return null ;
                       },
                       onChanged: (text) {
                         streetAddress = text;
                       },
                     ),
                     TextFormField(
                       decoration: InputDecoration(
                           label: Text(
                             'City',
                             style: TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: MyTheme.grayColor),
                           )),
                       validator: (text) {
                         if (text == null || text.isEmpty) {
                           return 'City is required';
                         }  return null ;
                       },
                       onChanged: (text) {
                         city = text;
                       },
                     ),
                     TextFormField(
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                           label: Text(
                             'Flat',
                             style: TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: MyTheme.grayColor),
                           )),
                       validator: (text) {
                         if (text == null || text.isEmpty) {
                           return 'Flat is required';
                         }  return null ;
                       },
                       onChanged: (text) {
                         flat = text;
                       },
                     ),
                   ],),
                 ),
               ) ,
              SizedBox(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .07,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.primaryColor,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                       AddressData addressData =AddressData(name: name,
                           phone: phone,
                           streetAddress: streetAddress,
                           city: city, flat: flat);
                        FireBaseUtils.addAddressToFireStore(addressData)
                            .timeout(const Duration(microseconds: 500),
                            onTimeout: () {
                              listProvider.getAddressData();
                            Navigator.pop(context);
                            });
                      }
                    },
                    child: Text(
                      'Save ',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                          color: MyTheme.whiteColor,
                          fontWeight: FontWeight.w800),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
