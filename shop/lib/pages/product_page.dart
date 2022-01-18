import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/models/product_list.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProductList productList = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Gerenciar produtos"),
    ),
    drawer: const AppDrawer(),
    body: Padding(padding: const EdgeInsets.all(8),
    child: ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index){
        return Text(productList.items[index].name);
      }),),
    );
  }
}