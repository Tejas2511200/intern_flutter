import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 100;

    String name = "world";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog app"),
      ), 
      body: Center(
        child: Container(
          child: Text("Welcome to $days days " + name),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
