import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:rushta_app/model/productmodel.dart';
import '../Design/firebase_utils/firebase_utils.dart';
import '../model/addressmodel.dart';
import '../model/storedata.dart';

class ListProvider extends ChangeNotifier {
  List <StoreData> storeDataList = [];
  List <ProductData> productData = [];
  List <AddressData> addressDataList = [ ];

  void getDataStore() async{QuerySnapshot<StoreData> querySnapshot
  =await FireBaseUtils.getStoreDataCollection().get();
    storeDataList = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();

    notifyListeners();


  }

void getDataProduct() async{QuerySnapshot<ProductData> querySnapshot =await FireBaseUtils.getProductDataCollection().get();
    productData = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();

    notifyListeners();


  }

void getAddressData() async{QuerySnapshot<AddressData> querySnapshot
=await FireBaseUtils.getAddressDataCollection().get();
    addressDataList = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();

    notifyListeners();


  }






}