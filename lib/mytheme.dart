import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xff1E1258);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = const Color(0xff363636);
  static Color grayColor = const Color(0xff707070);
   static Color greenColor = const Color(0xff13B58C);
   static Color scaffoldColor = const Color(0xffF6F9FF);



  static ThemeData lightTheme = ThemeData(
      primaryColor: MyTheme.primaryColor,
      scaffoldBackgroundColor: MyTheme.scaffoldColor,
      appBarTheme: AppBarTheme(

        backgroundColor: primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: grayColor,
        showUnselectedLabels: true,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700 ,

            letterSpacing: .19
        ),
        unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500 ,

            letterSpacing: .19
        )
      ),

      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18)))),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: MyTheme.whiteColor),
        titleSmall: TextStyle(

          fontWeight: FontWeight.w400,
          fontSize: 15 ,
          color: MyTheme.blackColor
        )

      ),



  );

}
