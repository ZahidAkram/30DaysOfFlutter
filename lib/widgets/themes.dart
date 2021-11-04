
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

class MyTheme{
  static ThemeData get lightTheme=> ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black)

      )
  );
  static ThemeData get darkTheme=> ThemeData(
    brightness: Brightness.dark,

  );
  //colors
    static Color creamColor= Color(0xfff5f5f5);
  static Color darkBlueishColor= Color(0xff403b58);

}