import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {

  final Product product;

  const ProductItem({ Key? key , required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
            },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
                 color: Theme.of(context).errorColor,
            onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: const  Text("Excluir produto"),
                  content: const  Text("Tem certeza"),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      child: const Text("Não"),
                      ),
                      TextButton(
                      onPressed: (){
                        Provider.of<ProductList>(context, listen: false).removeProduct(product);
                        Navigator.of(context).pop();
                      }, 
                      child: const Text("Sim"),
                    )
                  ],
                );
              });
      
            },
            )
          ],
          ),
        ),
    );
  }
}