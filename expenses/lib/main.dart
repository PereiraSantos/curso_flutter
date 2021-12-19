import 'dart:math';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/trasnsaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main()=> runApp(const ExpensesApp());

class ExpensesApp  extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        theme: ThemeData(
        fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
            headline1: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            button: const TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold)
          )), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.amber)
      )
    );
  }
}

class MyHomePage  extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction>_transactions = [];
  bool showCart = false;

  List<Transaction> get _recentTransaction{
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date){
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();

  }

  _deleteTransaction(String id){
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  void _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(context: context, builder: (_){
      return TransactionForm(onSubmit: _addTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text("Despesas Pessoais",
        style: TextStyle(
            fontSize:  20 * mediaQuery.textScaleFactor,
        ),
      ),
      actions:  [
        isLandscape ?
          IconButton(
              onPressed: () {
                setState(() {
                  showCart = !showCart;
                });
              },
              icon: Icon(showCart ? Icons.list : Icons.pie_chart),
          ) : const SizedBox(),
        IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon( Icons.add)),
      ],
    );

    final availableHeight = MediaQuery.of(context).size.height
        - appBar.preferredSize.height - mediaQuery.padding.top;

  return Scaffold(
    appBar: appBar,
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if(showCart || !isLandscape)
            SizedBox(
                height: availableHeight * (isLandscape ? 0.70 : 0.30),
                child: Chart(recentTransaction: _recentTransaction),
            ),
          if(!showCart || !isLandscape)
            SizedBox(
              height: availableHeight * (isLandscape ? 1 : 0.70),
                child: TransactionList(transactions: _transactions,onRemove: _deleteTransaction),
          ),
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



