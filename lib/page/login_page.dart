import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/routes.dart';

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Material( 
      /*child: Center(
          child: Text("login page ",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                  ), 
                  textScaleFactor: 2.0,
                  ),
                  ),*/
           child: SingleChildScrollView( 
             child: Center(
               child: Column(
                 children: [
                   Image.asset("assets/images/login_image.png",
                   fit: BoxFit.fill,),
           
                    
                    Text("weclome", 
           
                    style: TextStyle( color: Colors.red,fontWeight: FontWeight.w500,fontSize: 24),
                    
                    
                    ), 
                    
                    SizedBox(

                        height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 16.0),
                      child: Column(
                        children: [
                          TextFormField(
           
                            decoration: InputDecoration(
                                          hintText: "username" ,
                                          labelText: "enter user name",
                            ),
           
                          ), 
                          TextFormField(
                            
                            obscureText: true ,
                            decoration: InputDecoration(
                                          hintText: "password" ,
                                          labelText: "enter password",
                            ),
           
                          ),
                          SizedBox(

                        height: 20.0,
                    ), 

                    ElevatedButton(
                      
                     
                     onPressed: (){

                       Navigator.pushNamed(context, myroute.homeroute);
                    
                     },
                      child: Text("Submit"),

                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),)

                      
                      


                        ],
                      ),
                    ),
           
                 ], 
           
           
               ),
             ),
           )   

    ); 


  }
}
