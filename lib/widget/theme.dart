import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple, 
      cardColor: Colors.black, 
      canvasColor: darkcreamcolor, 
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));

  static Color creamColor = Color.fromARGB(255, 239, 232, 232);
  static Color darkbluish = Color.fromARGB(255, 130, 120, 184);
  static Color darkcreamcolor = Vx.gray800;
  static Color lightbluecolor = Vx.purple600;
}
