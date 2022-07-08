// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class ChangePassword extends StatefulWidget {


  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  var newPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  final newPasswordController = TextEditingController(); 
  final currentuser = FirebaseAuth.instance.currentUser; 

  changepassword() async { 
    try {
      await currentuser?.updatePassword(newPassword);  
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "password is changed",
            style: TextStyle(fontSize: 20.0), 
          ))); 
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginpage()), 
     );

    } catch (e) {
      
    }
     
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password: ',
                  hintText: 'Enter New Password',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
                controller: newPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState?.validate()) {
                  setState(() {
                    newPassword = newPasswordController.text;
                  }); 
                  changepassword();
                }
              },
              child: Text(
                'Change Password',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
