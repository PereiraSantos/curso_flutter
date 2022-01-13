import 'package:flutter/material.dart';
import 'package:shop/provider/counter.dart';

class CounterPage extends StatefulWidget {
 
 const CounterPage({ Key? key }) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("conter "),
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context)?.state.valor.toString()?? '0'),
          IconButton(onPressed: () {
            setState(() {
               CounterProvider.of(context)!.state.inc();
            });
            
          }, icon: const Icon(Icons.add),
          ),
           IconButton(onPressed: () {
             setState(() {
               CounterProvider.of(context)!.state.dec();          
             });
             
          }, icon: const Icon(Icons.remove),
          )
        ],),
    );
  }
}