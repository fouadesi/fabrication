import 'package:flutter/material.dart';import 'package:google_fonts/google_fonts.dart';InputDecoration dec(String n) {  return InputDecoration    (    labelStyle: GoogleFonts.cairo(color: Colors.green,),    hintText: n,    counter: Container(),    // If  you are using latest version of flutter then lable text and hint text shown like this    // if you r using flutter less then 1.20.* then maybe this is not working properly    floatingLabelBehavior: FloatingLabelBehavior.always,);}