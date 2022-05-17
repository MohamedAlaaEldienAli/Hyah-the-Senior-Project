

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch:defaultColor,
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: HexColor('333739'),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      )),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor:  HexColor('#0A81AB'),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.brown[300],
    elevation: 35,
    backgroundColor: HexColor('333739'),
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  cardColor: HexColor('424648'),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: HexColor('#d5d5d5'),
    ),
    caption: TextStyle(color:HexColor('#d5d5d5'), ),
  ),
  backgroundColor: Colors.deepOrange.withOpacity(0.7),
  dialogBackgroundColor: Colors.grey,
  fontFamily: 'ElMessiri',



);
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  cardColor: HexColor('#ecebeb'),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey[200],
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      )),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor:  HexColor('#0A81AB'),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:  HexColor('#0A81AB'),
    unselectedItemColor: Colors.brown[300],
    elevation: 35,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1,

    ),
    bodyText2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1,

    ),
    subtitle1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: HexColor('#4a4a4a'),
    ),
  ),
  fontFamily: 'ElMessiri',
  backgroundColor: Colors.deepOrange.withOpacity(0.7),
);