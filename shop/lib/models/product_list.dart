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
}