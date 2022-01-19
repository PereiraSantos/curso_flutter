import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
 
 const ProductDetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
 
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(product.imageUrl, fit: BoxFit.cover,),
            ),
            const SizedBox(height: 10,),
            Text('${product.price}',
             style: const  TextStyle(
               fontSize: 20, 
               color: Colors.grey
              ),
            ),
            const SizedBox(height: 10,),
            Container(
               padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(product.description,textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        ),
    );
  }
}