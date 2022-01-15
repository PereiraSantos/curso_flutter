import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item_widget.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("carrinho"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text('Total', style: TextStyle(fontSize: 20),),
                const  SizedBox(width: 10,),
                 Chip(
                   backgroundColor: Theme.of(context).primaryColor,
                   label: Text('R\$${cart.totalAmount.toStringAsFixed(2)}', style: TextStyle(color: Theme.of(context).primaryTextTheme.headline6?.color),)),
                   const Spacer(),
                   TextButton(
                   child: const Text('COMPRAR'),
                   style: TextButton.styleFrom(
                     textStyle: TextStyle(color: Theme.of(context).primaryColor)
                   ),
                   onPressed: (){
                     Provider.of<OrderList>(
                       context,
                        listen: false).addOrder(cart);
                        
                    cart.clear();
                   }, 
                   )
                ],
                ),
            ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (contex, index){
                  return CartItemWidget(cartItem: items[index]);
                }))
        ],
      ),
    );
  }
}