// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, null_aware_in_condition, can_be_null_after_null_aware

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final email = FirebaseAuth.instance.currentUser?.email;
  final creationTime = FirebaseAuth.instance.currentUser?.metadata.creationTime;

  User user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user?.emailVerified) {
      await user?.sendEmailVerification();
      print('Verification Email has benn sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has benn sent',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            'User ID: $uid',
            style: TextStyle(fontSize: 15.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Row(        
                children: [
                  Text(
                    'Email: $email',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  user?.emailVerified
                      ? Text(
                          'verified',
                          style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                        )
                      : TextButton(
                          onPressed: () => {verifyEmail()},
                          child: Text('Verify Email',style: TextStyle(fontSize: 10),))
                ],
              ),
            ),
          ),
          Text(
            'Created: $creationTime',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}