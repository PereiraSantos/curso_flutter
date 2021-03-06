import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final void Function(String) onRemove;

   const TransactionList({Key? key, required this.transactions, required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions .isEmpty ?
        LayoutBuilder(builder: (ctx, constraints){
          return  Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.05),
              const Text("Nehuma Transação Cadastrada", style: TextStyle(fontSize: 20)),
              SizedBox(
                  height: constraints.maxHeight * 0.60,
                  child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)),
            ],
          );
        })
   : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){

          final tr = transactions[index];

          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                      child: Text('R\$ ${tr.value.toStringAsFixed(2)}')),
                ),
              ),
              title: Text(tr.title, style: Theme.of(context).textTheme.subtitle1,),
              subtitle: Text(DateFormat('d MMM y').format(tr.date), style: const TextStyle(
                  fontWeight: FontWeight.bold)),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => onRemove(tr.id),
              ),
            ),
          );
        }
    );
  }
}

