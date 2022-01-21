import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier{

  final List<Product> _items = dummyProducts;


  List<Product> get items => [...items];

  List<Product> get favoriteItems => _items.where((prod) => prod.isFavorite!).toList();

  int get itemsCount => _items.length;
  

  void addproduct(Product product){
    _items.add(product);
    notifyListeners();
  }

  void saveProduct(Map<String, Object> data){

    bool hasId = data['id'] != null;

      final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String ,
      description: data['description']  as String,
      price: data['price']  as double,
      imageUrl: data['urlImage']  as String
      );
      if(hasId){
          updateProduct(product);
      }else{
         addproduct(product);
      }
     
  }

  void updateProduct(Product product){
      int index = _items.indexWhere((p) => p.id == product.id);

      if(index >= 0){
        _items[index] = product;
        notifyListeners();
      }
  }

    void removeProduct(Product product){
      int index = _items.indexWhere((p) => p.id == product.id);

      if(index >= 0){
        _items.removeWhere((p) => p.id == product.id);
        notifyListeners();
      }
  }

}