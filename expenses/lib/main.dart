import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/trasnsaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';


main()=> runApp(ExpensesApp());

class ExpensesApp  extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage()
    );
  }
}

class MyHomePage  extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _transactions = [
    Transaction(id: "t1", title: "novo tenis de corrida", value: 310.76, date: DateTime.now()),
    Transaction(id: "t1", title: "conta de luz", value: 211.03, date: DateTime.now())
  ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now()
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }
  void _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(context: context, builder: (ctx){
      return TransactionForm(onSubmit: _addTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Despesas Pessoais"),
      actions:  [
         IconButton(
             onPressed: () => _openTransactionFormModal(context),
             icon: const Icon(Icons.add))
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
           const SizedBox(
            width: double.infinity,
            child:  Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Grafico"),
            ),
          ),

          TransactionList(transactions: _transactions),

        ],
      ),
    ),
    floatingActionButton:  FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => _openTransactionFormModal(context),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
  }
}



