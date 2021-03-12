import 'package:flutter/material.dart';import 'package:google_fonts/google_fonts.dart';ThemeData theme() {  return ThemeData(    outlinedButtonTheme: OutlinedButtonThemeData(      style: OutlinedButton.styleFrom(primary:      Color.fromRGBO(253, 127, 44,1),backgroundColor: Color.fromRGBO(253, 127, 44,1),),),    scaffoldBackgroundColor: Colors.white,    accentColor:Color.fromRGBO(253, 127, 44,1),    appBarTheme: appBarTheme(),    textTheme: textTheme(),    inputDecorationTheme: inputDecorationTheme(),    visualDensity: VisualDensity.adaptivePlatformDensity,  );}InputDecorationTheme inputDecorationTheme() {  OutlineInputBorder outlineInputBorder = OutlineInputBorder(    borderRadius: BorderRadius.circular(28),    borderSide: BorderSide(color : Color.fromRGBO(253, 127, 44,1)),    gapPadding: 10,);  return InputDecorationTheme(    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),    enabledBorder: outlineInputBorder,    focusedBorder: outlineInputBorder,    border: outlineInputBorder,  );}TextTheme textTheme() {  return TextTheme(    bodyText1: GoogleFonts.tajawal(color: Color.fromRGBO(253, 127, 44,1)),  );}AppBarTheme appBarTheme() {  return AppBarTheme(    color: Colors.white,    elevation: 0,    brightness: Brightness.light,    centerTitle: true,    iconTheme: IconThemeData(color: Colors.black),    textTheme: TextTheme(      headline6: GoogleFonts.cairo(color: Color(0XFF8B8B8B), fontSize: 20),    ),  );}