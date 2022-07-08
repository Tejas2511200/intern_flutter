import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class mystore extends VxStore {
  CatalogModel catalog; 
  cartmodel cart; 

  mystore(){
    catalog = CatalogModel(); 
    cart = cartmodel();  
    cart.catelog = catalog;

    
  }
}