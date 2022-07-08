import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catelog.dart';
import '../theme.dart';

class addtocart extends StatelessWidget {
  final Item catalog;
  addtocart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [addmutation,removemutation]);

    final cartmodel _cart = (VxState.store as mystore).cart;
    bool isincart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
        onPressed: () {
          if (!isincart) {
            addmutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              MyTheme.darkbluish,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )),
        child:
            isincart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
