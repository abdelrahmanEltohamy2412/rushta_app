import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/mytheme.dart';

import '../../../model/storedata.dart';
import '../../../provider/provider.dart';
import '../../firebase_utils/firebase_utils.dart';
import 'aftercreate.dart';




class CreateStoreScreen extends StatefulWidget {
  const CreateStoreScreen({super.key});

  static const String routeName = ' createStore';

  @override
  State<CreateStoreScreen> createState() => _CreateStoreScreenState();
}

class _CreateStoreScreenState extends State<CreateStoreScreen> {
  var formKey = GlobalKey<FormState>();
  String? id= '';

  String? pharamacyName= '';

  String? webAdress= '';

  String? storeDescripiton= '';

  String? numberOfBranches= ' ';

  String? BranchesAdrees='';

  String? country= '';

  String? phoneNumber= '';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
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
                    'My Store',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Image.asset('assets/images/img_1.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            const Text(
              textAlign: TextAlign.center,
              'This information is used to set up your shop',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      textAlign: TextAlign.start,
                      'pharmacy Name ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyTheme.grayColor)),
                  TextFormField(
                    decoration: const InputDecoration(),
                    validator:  (text){
                      if ( text == null|| text.isEmpty ){
                         return 'enter pharmacy Name';
                      }
                      return null;
                    },
                    onChanged: (text){
                      pharamacyName = text ;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                      textAlign: TextAlign.start,
                      'Store Web Address',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyTheme.grayColor)),
                  TextFormField(
                    decoration: const InputDecoration(),
                    validator:  (text){
                      if ( text == null|| text.isEmpty ){
                        return 'enter Store Web Address';
                      }
                      return null;
                    },
                    onChanged: (text){
                      webAdress = text ;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                      textAlign: TextAlign.start,
                      'Store Description',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyTheme.grayColor)),
                  TextFormField(
                    decoration: const InputDecoration(),
                    validator:  (text){
                      if ( text == null|| text.isEmpty ){
                        return 'enter Store Description';
                      }
                      return null;
                    },
                    onChanged: (text){
                      storeDescripiton = text ;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                      textAlign: TextAlign.start,
                      'number of branches',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyTheme.grayColor)),
                  TextFormField(
                    decoration: const InputDecoration(),
                    validator:  (text){
                      if ( text == null|| text.isEmpty ){
                        return 'enter number of branches';
                      }
                      return null;
                    },
                    onChanged: (text){
                      numberOfBranches = text ;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                      textAlign: TextAlign.start,
                      'Branch address',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyTheme.grayColor)),
                  TextFormField(
                    decoration: const InputDecoration(),
                    validator:  (text){
                      if ( text == null|| text.isEmpty ){
                        return 'enter Branch address';
                      }
                      return null;
                    },  onChanged: (text){
                    BranchesAdrees = text ;
                  },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                      textAlign: TextAlign.start,
                      'Country',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyTheme.grayColor)),
                  TextFormField(
                    decoration: const InputDecoration(),
                    validator:  (text){
                      if ( text == null|| text.isEmpty ){
                        return 'enter country name';
                      }
                      return null;
                    },
                    onChanged: (text){
                      country = text ;
                    },

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                      textAlign: TextAlign.start,
                      'phone number',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: MyTheme.grayColor)),
                  TextFormField(
                    decoration: const InputDecoration(),
                    validator:  (text){
                      if ( text == null|| text.isEmpty ){
                        return 'enter phone number';
                      }
                      return null;
                    },
                    onChanged: (text){
                      phoneNumber = text ;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .07,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.primaryColor,
                          padding: const EdgeInsets.all(15),
                        ),
                        onPressed: () {

                          createStore();

                        },
                        child: Text(
                          'Create ',
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
            )
          ],
        ),
      ),
    )));

  }


  void createStore() {
    var listProvider = Provider.of<ListProvider>(context,listen: false) ;
    if(formKey.currentState?.validate()== true){

      StoreData storeData = StoreData(pharamacyName: pharamacyName,
          webAdress: webAdress,
          storeDescripiton: storeDescripiton,
          numberOfBranches: numberOfBranches,
          BranchesAdrees: BranchesAdrees,
          country: country, phoneNumber: phoneNumber);
       FireBaseUtils.addStoreToFireStore(storeData).timeout(Duration(microseconds: 500),
       onTimeout: (){
              print('donnnnnnnnnnnnnnnnnnnnne');
         if(listProvider.storeDataList.isEmpty){
           listProvider.storeDataList.add(storeData);
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>  AfterCreate(), ),
           );

         }
       }
       );












    }
  }


}
