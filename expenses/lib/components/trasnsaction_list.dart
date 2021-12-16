import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

   const TransactionList({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: transactions .isEmpty ? Column(
        children: [
          const Text("Nehuma Transação Cadastrada", style: TextStyle(fontSize: 20)),
          SizedBox(
              height: 150,
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)),
        ],
      ): ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index){

            final tr = transactions[index];

            return Card(child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor,width: 2)
                  ),
                  child: Text('R\$ ${tr.value.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.title, style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat('d MMM y').format(tr.date), style: const TextStyle(
                        fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ));
          }
      ),
    );
  }
}

