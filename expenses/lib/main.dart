import 'dart:math';

import 'package:expenses/components/chart.dart';
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
        home: MyHomePage(),
        theme: ThemeData(
        fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
            headline1: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.amber)
      )
    );
  }
}

class MyHomePage  extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _transactions = [
    Transaction(id: "t0", title: "novo tenis de corrida", value: 310.76, date: DateTime.now().subtract(const Duration(days: 3))),
    Transaction(id: "t1", title: "conta de luz", value: 211.03, date: DateTime.now()..subtract(const Duration(days: 4))),
    Transaction(id: "t2", title: "conta de lagua", value: 301.03, date: DateTime.now()..subtract(const Duration(days: 5)))
  ];

  List<Transaction> get _recentTransaction{
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

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

    Navigator.of(context).pop();

  }
  void _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(context: context, builder: (_){
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
            SizedBox(
            width: double.infinity,
            child:  Card(
              color: Colors.blue,
              elevation: 5,
              child: Chart(recentTransaction: _recentTransaction),
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



