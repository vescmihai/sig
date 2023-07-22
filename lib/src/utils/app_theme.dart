import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  AppThemeData._();
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFF007EE7),
    primaryColorDark: Color(0xFFEFF5FC),
    hoverColor: Colors.white60,
    dividerColor: Colors.grey[200],
    fontFamily: GoogleFonts.openSans().fontFamily,
    buttonTheme: ButtonThemeData(buttonColor: Colors.blue[900],),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color:  Colors.blue[700],
      //titleTextStyle: TextStyle(fontSize: 20),
      iconTheme: const IconThemeData(color: Colors.blue),
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black,fontSize: 20.0),
      titleMedium: TextStyle(fontSize: 16.0),
      titleSmall: TextStyle(color: Colors.blue,fontSize: 20.0),
      bodyLarge: TextStyle(color: Colors.indigo,fontSize: 20.0),
      bodyMedium: TextStyle(fontSize: 15.0),
      bodySmall: TextStyle(fontSize: 10.0),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    cardTheme: const CardTheme(color: Colors.white),
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.blue),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );
}
