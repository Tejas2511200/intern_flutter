// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/page/cart_page.dart';
import 'package:flutter_catalog/page/home_page.dart';
import 'package:flutter_catalog/page/login_page.dart';
import 'package:flutter_catalog/utilites/routes.dart';
import 'package:flutter_catalog/widget/theme.dart'; 
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';
// import 'package:flutter_application_1/page/home_page.dart';
// import 'package:flutter_application_1/page/login_page.dart';
// import 'package:flutter_application_1/utilites/routes.dart';
// import 'package:flutter_application_1/widget/theme.dart';

void main() {  
  WidgetsFlutterBinding.ensureInitialized(); // main app
  runApp(VxState( // root tree
    store: mystore(), 
    
    
     child: MyApp()));
}

class MyApp extends StatelessWidget {
final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("somthing Went wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return MaterialApp( 
              debugShowCheckedModeBanner: false,
              title: 'SHOPWORLD.com',
               theme: ThemeData(primarySwatch: Colors.green),
              home: loginpage(), 
             initialRoute: myroute.loginroute,
              routes: {
               myroute.cartroute :  (context) => cartpage(), 
              },
            ); 
          });
  }
}
