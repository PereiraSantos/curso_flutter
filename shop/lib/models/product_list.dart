import 'package:flutter/widgets.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier{

  final List<Product> _items = dummyProducts;

  List<Product> get items => [...items];

  List<Product> get favoriteItems => _items.where((prod) => prod.isFavorite!).toList();
  

  void addproduct(Product product){
    _items.add(product);
    notifyListeners();
  }
/*
    bool _showFavoriteOnly = false;

  List<Product> get items{
    if(_showFavoriteOnly){
      return _items.where((prod) => prod.isFavorite!).toList();
    }
    return [...items];
  }

  void showFavoriteOnly(){
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll(){
    _showFavoriteOnly = false;
    notifyListeners();
  
  }*/
}