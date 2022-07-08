// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_catalog/utilites/routes.dart';

//import 'package:flutter_application_1/utilites/routes.dart';

class mydrawer extends StatelessWidget {
  //const mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    // ignore: prefer_const_declarations
    final imageeurl = 
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE_Ys-x5FejCwJpsdqXPRgriNYXj7N3w_yFmAcMdB8eFLXoejSDqyd-lQOTzc66RFG22Q&usqp=CAU";
    
    return Drawer(
       child: Container( 
         color: Colors.red,
         child: ListView (
           // ignore: prefer_const_literals_to_create_immutables  


            children: [
             DrawerHeader(  
               decoration: BoxDecoration(color : Colors.lightBlue),
             padding: EdgeInsets.zero,
               child: UserAccountsDrawerHeader( 
                     margin: EdgeInsets.zero, 
                     decoration: BoxDecoration( 
                       color: Colors.red,
                     ),
                     accountName: Text("tejas agarwa", ),
                     accountEmail: Text("teaja500@gmail.com"),
                     currentAccountPicture: CircleAvatar(
                       backgroundImage: NetworkImage(imageeurl),
                     ),
                     ),
          //  children: [
          //    DrawerHeader(  
          //      decoration: BoxDecoration(color : Colors.lightBlue),
          //    padding: EdgeInsets.zero,
          //      child: Column(
          //        children: [
          //          UserAccountsDrawerHeader( 
          //            margin: EdgeInsets.zero, 
          //            decoration: BoxDecoration( 
          //              color: Colors.red,
          //            ),
          //            accountName: Text("tejas agarwa", ),
          //            accountEmail: Text("teaja500@gmail.com"),
          //            currentAccountPicture: CircleAvatar(
          //              backgroundImage: NetworkImage(imageeurl),
          //            ),
          //            ),

          //             UserAccountsDrawerHeader( 
          //        margin: EdgeInsets.zero, 
          //        decoration: BoxDecoration( 
          //          color: Colors.red,
          //        ),
          //        accountName: Text("tejas agarwa", ),
          //        accountEmail: Text("teaja500@gmail.com"),
          //        currentAccountPicture: CircleAvatar(
          //          backgroundImage: NetworkImage(imageeurl),
          //        ),
          //        ), 
          //        ],  

                 
               //),   

                 

                 ),
                 ListTile( 
                   onTap: () {
                     Navigator.pushNamed(context, myroute.loginroute);
                   },
                   leading: Icon(CupertinoIcons.home,color: Colors.white,), 
                    
                   title: Text("Home",textScaleFactor: 1.2, style: TextStyle(
                     color: Colors.white,
                    fontWeight: FontWeight.bold,
                   ),
                   )
                 ), 

                ListTile( 
    
                   leading: Icon(CupertinoIcons.home,color: Colors.white,), 
                    
                   title: Text("Email",textScaleFactor: 1.2, style: TextStyle(
                     color: Colors.white,
                    fontWeight: FontWeight.bold,
                   ),
                   )
                 ), 

                  ListTile(
                   leading: Icon(CupertinoIcons.home,color: Colors.white,), 
                    
                   title: Text("Profile",textScaleFactor: 1.2, style: TextStyle(
                     color: Colors.white,
                    fontWeight: FontWeight.bold,
                   ),
                   )
                 ),
           ],//childern 
           ),
       ),
    );
    
  }
}