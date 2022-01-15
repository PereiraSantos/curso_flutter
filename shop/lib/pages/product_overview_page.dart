import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/badge.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOption{
  Favorite,
  all
}

class ProductOverviewPage extends StatefulWidget {
  
  const ProductOverviewPage({ Key? key }) : super(key: key);

  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {


  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha loja"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(child: Text("somente Favoritos"), value: FilterOption.Favorite),
              const PopupMenuItem(child: Text("Todos"), value: FilterOption.all,)
              ],
              onSelected: (FilterOption selectedValue){
                setState(() {
                    if(selectedValue == FilterOption.Favorite){
                     _showFavoriteOnly = true;
                  
                  }else{
                    _showFavoriteOnly = false;
                  }
                });
              
              },
              ),
              Consumer<Cart>(
                child: IconButton(onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                }, icon: const Icon(Icons.shopping_cart)),
                builder: (ctx, cart, child) => Badge(
                  value: cart.itemsCount.toString(),
                  child: child!,
              ),
              ),
        ],
      
      ),
      body: ProductGrid(showFavoriteOnly: _showFavoriteOnly),
      drawer: const AppDrawer(),
    );
  }
}