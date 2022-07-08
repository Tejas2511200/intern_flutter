// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore, camel_case_types, empty_catches, use_build_context_synchronously, missing_return, null_aware_in_condition

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup.dart';

class forgot_pass extends StatefulWidget {
 

  @override
  State<forgot_pass> createState() => _forgot_passState();
}

class _forgot_passState extends State<forgot_pass> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  final emailcontroller = TextEditingController(); 

  resetpassword() async {
    try {
      await  FirebaseAuth.instance.sendPasswordResetEmail(email: email); 
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "password reset email has been sent",
            style: TextStyle(fontSize: 20.0),
          )));
    } on FirebaseAuthException catch (e) {
        if(e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "email not found",
            style: TextStyle(fontSize: 20.0),
          )));
        }     
    }
  }

  @override
  dispose() {
    emailcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(icon: Icon(Icons.arrow_back_ios), 
        onPressed: () {
           Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                loginpage(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
        }
        ),
        title: Text("user login"), 
        
      ),
      body: Form(
        // in form we cannot create more than one chlid
        key: _formKey,
        child: Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal:
                    30), // edgeiset use for giving padding to any widget
            child: ListView(
              // to show as a list we use list view
              children: [
                // to work with more than one widgtet we use children
                Container(
                  // it is one type of widget that we can create our own
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    //When app start cursore will focus on this textfiled when its true.
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Email: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter  email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid email';
                      }
                    },
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(left: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate()) {
                              setState(() {
                                email = emailcontroller.text;
                              });
                              resetpassword();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              // design on elvated button
                              primary: Colors.purple,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                                  textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          child: Text(
                            "Send Email",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        )
                      ],
                    )),
                Container(
                  child: Row(children: [
                    Text("don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                signup(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Text("sign up"),
                    )
                  ]),
                )
              ], // children
            )),
      ),
    );
  }
}
