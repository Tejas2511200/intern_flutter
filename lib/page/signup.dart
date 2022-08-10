// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore, empty_catches, avoid_print, use_build_context_synchronously, missing_return, null_aware_in_condition

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';


class signup extends StatefulWidget {
  

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();

  var uname = "";
  var email = "";
  var password = "";
  var cpassword = "";

  final unamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final cpasswordcontroller = TextEditingController();

  registration() async {
    try {
      UserCredential usercredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(usercredential);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "registration successfull... please login",
            style: TextStyle(fontSize: 20.0),
          )));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginpage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
        print("password is too short"); 
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "password is too short",
            style: TextStyle(fontSize: 20.0),
          )));
      } else if(e.code == 'email-already-in-use'){
        print("email already exists"); 
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "email already exists",
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
      appBar: AppBar(  
        backgroundColor: Colors.transparent,
              elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),color: Colors.black, 
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
                  ClipRRect(borderRadius: BorderRadius.circular(8.0) ,child: Image.network("https://images.unsplash.com/photo-1543599538-a6c4f6cc5c05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2lnbiUyMHVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                   height: 190.0,
     fit: BoxFit.fill
                  
                  )
                  
                  ),
                Container(
                  
                  // it is one type of widget that we can create our own
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    //When app start cursore will focus on this textfiled when its true.
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'UserName: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: unamecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter  UserName';
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
                  // it is one type of widget that we can create our own
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    //When app start cursore will focus on this textfiled when its true.
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm password: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    controller: cpasswordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter  password';
                      } else if (value.length < 6) {
                        return 'Password length should be Greater Than 6';
                      } else if (value != passwordcontroller.text) {
                        return 'password does not match';
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
                                uname = unamecontroller.text;
                                email = emailcontroller.text;
                                password = passwordcontroller.text;
                                cpassword = cpasswordcontroller.text;
                              });
                            }
                            registration();
                          },
                          child: Text(
                            "sign up",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        )
                      ],
                    )),
                Container(
                  child: Row(children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                loginpage(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Text("sign in"),
                    )
                  ]),
                )
              ], // children
            )),
      ),
    );
  }
}
