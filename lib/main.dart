
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushta_app/Design/login_signUp/signUp.dart';

import 'package:rushta_app/provider/provider.dart';

import 'Design/home/bottomNavigationBar.dart';
import 'Design/home/homeScreen.dart';
import 'Design/home/storeScreen/Addproduct.dart';
import 'Design/home/storeScreen/afterAddProducta.dart';
import 'Design/home/storeScreen/createStore.dart';
import 'Design/home/storeScreen/viewProfileScreen.dart';
import 'Design/login_signUp/login.dart';
import 'mytheme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized(

  );
  await Firebase.initializeApp(

      options: const FirebaseOptions(
        apiKey: 'key',
        appId: 'id',
        messagingSenderId: 'sendid',
        projectId: 'myapp',
        storageBucket: 'myapp-b9yt18.appspot.com',
      )
  );
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  runApp(ChangeNotifierProvider(create: (context)=>ListProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:MyTheme.lightTheme,
      initialRoute:   SignScreen.routeName,
      routes: {
        SignScreen.routeName : (context)=>const SignScreen(),
        HomeScreen.routeName:(context)=>const HomeScreen() ,
        BottomNavigationBarScreen.routName: (context)=> BottomNavigationBarScreen(),
        CreateStoreScreen.routeName :(context)=>const CreateStoreScreen(),
        AddProduct.routeName : (context)=>const AddProduct(),
        AfterAddProduct.routName : (context)=>const AfterAddProduct(),
        ViewProfileScreen.routeName:(context)=> const ViewProfileScreen(),
        SignScreen.routeName :(context)=> SignScreen(),
        SignUpScreen.routeName :(context)=>SignUpScreen()




      },
    );
  }
}
