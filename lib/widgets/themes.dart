import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData( 
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBluishColor,
         accentColor: darkBluishColor,
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        )
        
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData( 
    brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        buttonColor: lightBluishColor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        )
        
      );

  //Color
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
        
}