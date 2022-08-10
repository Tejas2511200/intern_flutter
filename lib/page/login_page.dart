// ignore_for_file: camel_case_types, prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, use_build_context_synchronously, empty_catches, avoid_print, missing_return, null_aware_in_condition
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/page/signup.dart';
import 'package:flutter_catalog/page/user.dart';

import 'forgot_password.dart';

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _formKey = GlobalKey<FormState>();
  final LinearGradient _gradient = LinearGradient(colors: <Color>[
    Colors.red,
    Colors.yellow,
  ]);

  var email = "";
  var password = "";

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => usermain(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("user is not registered");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "user is not registered",
              style: TextStyle(fontSize: 20.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "wrong password ",
              style: TextStyle(fontSize: 20.0),
            )));
      }
    }
  }

  @override
  dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 240, 221),
      body: Form(
        // in form we cannot create more than one chlid
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal:
                    30), // edgeiset use for giving padding to any widget
            child: ListView(
              // to show as a list we use list view
              children: <Widget>[
                Center(
                    child: ShaderMask( 
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (rect) => LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Colors.indigoAccent,Colors.pink]).createShader(rect),
                        
                        child: Text(
                          'SHOPWORLD.com',
                          style: TextStyle(fontSize: 30),
                        ))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                          "https://images.unsplash.com/photo-1460467820054-c87ab43e9b59?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=767&q=80")),
                ),
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
                  // it is one type of widget that we can create our own
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    //When app start cursore will focus on this textfiled when its true.
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'password: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter  password';
                      } else if (value.length < 6) {
                        return 'should be Greater Than 6 digits';
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
                                password = passwordcontroller.text;
                              });
                              userlogin();
                            }
                          },
                          child: Text("login"),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, a, b) =>
                                        forgot_pass(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                  (route) => false);
                            },
                            child: Text("Forgot Password",
                                style: TextStyle(fontSize: 14.0,color: Colors.green)))
                      ],
                    )),
                Container(
                  child: Row(children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => signup(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                            (route) => false);
                      },
                      child: Text("sign up",style: TextStyle(color: Colors.green),),
                    )
                  ]),
                )
              ], // children
            )),
      ),
    );
  }
}
