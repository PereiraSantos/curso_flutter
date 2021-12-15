import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  TransactionForm({required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _onSubmit(){
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if(title.isEmpty || value <= 0){
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _onSubmit(),
              decoration: const InputDecoration(
                  labelText: "Titulo"
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmit(),
              decoration: const InputDecoration(
                  labelText: "Vlor (R\$)"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    onPressed: _onSubmit,
                    child: const Text("Nova Transacao",
                      style: TextStyle(color: Colors.purple),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

