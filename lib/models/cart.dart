import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widget/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/utilites/routes.dart';

class cartmodel { 


  //catalog feild
  CatalogModel _catelog; 


  // collection of ids 
  final List<int> _itemids = [];

  //get catelog
  CatalogModel get catelog => _catelog;

  get itemids => null;

  set catelog(CatalogModel newcatelog) {
    assert(newcatelog != null);
    _catelog = newcatelog;
  }

  //get items in the cart

  List<Item> get items => _itemids.map((id) => _catelog.getById(id)).toList();

//get total

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  //add item

 
  // remove item
  
}


class addmutation extends VxMutation<mystore>{
  final Item item;

  addmutation(this.item);
  @override 
  perform() {
    // TODO: implement perform
    store.cart._itemids.add(item.id);
  }
} 

class removemutation extends VxMutation<mystore>{
  final Item item;

  removemutation(this.item);
  @override 
  perform() {
    // TODO: implement perform
    store.cart._itemids.remove(item.id);
  }
}