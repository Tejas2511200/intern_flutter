import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widget/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/utilites/routes.dart';

import 'dart:convert';

import '../widget/home_widgets/catalog_header.dart';
import '../widget/home_widgets/catelog_list.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  get productsdata => null;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    final catelogjson =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodedata = jsonDecode(catelogjson);
    final productsdata = decodedata["product"];
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, myroute.cartroute),
        backgroundColor: MyTheme.darkbluish,
        child: Icon(CupertinoIcons.cart),
      ),
      //backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalogheader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                cataloglist().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
