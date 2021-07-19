import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData themeDataLightMode() {
  return ThemeData(
      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,          //دي عشان تعمل توافق بين الالوان و تخلي اللون بتاع التكست يظهر
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:Brightness.dark
          ),
          titleTextStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
              fontSize: 25
              )),
    scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          headline5: TextStyle(color: Colors.black,fontWeight:FontWeight.bold ),
        headline6:  TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
      )

  );
}
