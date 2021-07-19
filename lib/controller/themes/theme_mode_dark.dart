import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData themeDataDarkMode() {
  return ThemeData(
    appBarTheme: AppBarTheme(
        backwardsCompatibility: false,          //دي عشان تعمل توافق بين الالوان و تخلي اللون بتاع التكست يظهر
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFF52595D),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF52595D),
            statusBarIconBrightness:Brightness.light
        ),
        titleTextStyle:
        TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
            fontSize: 25
        )),
    scaffoldBackgroundColor: Color(0xFF52595D),
    textTheme: TextTheme(
      headline5: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
      headline6:  TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
    )
  );
}
