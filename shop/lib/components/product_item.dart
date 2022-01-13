import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {


  const ProductItem({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product
            );
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
          ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              product.toogleFavorite();
            },
            icon:  Icon(product.isFavorite! ?  Icons.favorite : Icons.favorite_border, color: Theme.of(context).colorScheme.secondary),
          ),
          title: Text(product.title, style: const TextStyle(fontFamily: 'Lato'), textAlign: TextAlign.center),
          trailing: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.shopping_cart)),
          ),
      ),
    );
  }
}