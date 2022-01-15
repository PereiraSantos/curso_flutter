import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';

class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items  {
    return {..._items};
  }

  int itemsCount(){
    return _items.length;
  }

  double get totalAmount{
    double total = 0;

    _items.forEach((key, cartItem) { 
        total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  void addItems(Product product){
    if(_items.containsKey(product.id)){
      _items.update(product.id, (existintItem) => CartItem(
        id: existintItem.id,
        producId: existintItem.producId,
        name: existintItem.name,
        quantity: existintItem.quantity! + 1,
        price: existintItem.price,
      ));
    }else{
      _items.putIfAbsent(product.id, () => 
       CartItem(
        id: Random().nextDouble().toString(),
        producId: product.id,
        name: product.name,
        quantity:  1,
        price: product.price,
      )
      );
    }
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }



}