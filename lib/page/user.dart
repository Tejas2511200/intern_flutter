// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, sort_child_properties_last, camel_case_types, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/page/home_page.dart';
import 'login_page.dart';
import 'change_password.dart';
//import 'package:flutter_firebase_email/pages/user/dashboard.dart';
import 'profile.dart';


class usermain extends StatefulWidget {


  @override
  State<usermain> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<usermain> { 
   final currentuser = FirebaseAuth.instance.currentUser; 
  int _selectindex = 0; 
  static List<Widget> _Widgetoption = <Widget>[
    homepage(), 
    Profile(),
    ChangePassword(),
  ]; 
  void _onitemtapped(int index){
    setState(() {
      _selectindex = index; 
    });
  }
  
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(  
        title: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [ 
            
            Text("Welcome user"), 
           ], 
        ), 

        actions: [ ElevatedButton(
              onPressed: () async => {
               await FirebaseAuth.instance.signOut(),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginpage()
                      ,
                    ),
                    (route) => false)
              }, 
              child: Text("logout"), 
              style: ElevatedButton.styleFrom(primary: Colors.green),
            )
          ],
        
      ),  
      
      body: _Widgetoption.elementAt(_selectindex), 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem > [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'dashboard',
            ),  

            BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'my profile',
            ),   

            BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'change password',
            ), 

        ], 
        currentIndex: _selectindex, 
        selectedItemColor: Colors.amber[800], 
        onTap: _onitemtapped,
      ),
    );
    
  }
}