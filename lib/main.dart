// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/login_page.dart';
import 'package:flutter_application_1/utilites/routes.dart';
import '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//const MyApp({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //  home: homepage(),
        themeMode: ThemeMode.light,
            theme: ThemeData(
            primarySwatch: Colors.deepPurple, brightness: Brightness.light),
         // debugShowCheckedModeBanner: false,

            initialRoute: "/login",
        routes: {
          "/": (context) => loginpage(),
          myroute.homeroute: (context) => homepage(),
          myroute.loginroute: (context) => loginpage(),
        });
  }
}
 