



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rushta_app/model/addressmodel.dart';
import 'package:rushta_app/model/storedata.dart';
import 'package:rushta_app/model/productmodel.dart';

class FireBaseUtils {
  static CollectionReference<StoreData> getStoreDataCollection(){
    return   FirebaseFirestore.instance.collection(StoreData.collectionName).withConverter<StoreData>(
        fromFirestore: (snapshot, options)=> StoreData.fromJson(snapshot.data()!),
        toFirestore:(storeData,options) => storeData.toJson()
    );
  }
 static Future<void> addStoreToFireStore(StoreData storeData){
    var storeDataCollection = getStoreDataCollection();
    DocumentReference<StoreData> storeDataRef = storeDataCollection.doc();
    storeData.id = storeDataRef.id;
    return storeDataRef.set(storeData);

  }


  static CollectionReference<ProductData> getProductDataCollection(){
    return   FirebaseFirestore.instance.collection(ProductData.collectionName).withConverter<ProductData>(
        fromFirestore: (snapshot, options)=> ProductData.fromJson(snapshot.data()!),
        toFirestore:(productData,options) =>productData.toJson()
    );
  }
  static Future<void> addProductToFireStore(ProductData productData){
    var productDataCollection = getProductDataCollection();
    DocumentReference<ProductData> productDataRef = productDataCollection.doc();
    productData.id = productDataRef.id;
    return productDataRef.set(productData);

  }

  static CollectionReference<AddressData> getAddressDataCollection(){
    return   FirebaseFirestore.instance.collection(AddressData.collectionName).withConverter<AddressData>(
        fromFirestore: (snapshot, options)=> AddressData.fromJson(snapshot.data()!),
        toFirestore:(addressData,options) =>addressData.toJson()
    );
  }
 static Future<void> addAddressToFireStore(AddressData addressData){
    var addressDataCollection = getAddressDataCollection();
    DocumentReference<AddressData> addressDataRef = addressDataCollection.doc();
    addressData.addressId = addressDataRef.id;
    return addressDataRef.set(addressData);

  }



}