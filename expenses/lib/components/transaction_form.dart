import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double, DateTime) onSubmit;

  TransactionForm({required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _onSubmit(){
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if(title.isEmpty || value <= 0 ||_selectedDate == null){
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((picker) {
      if (picker == null) {
        return;
      }
      setState(() {
        _selectedDate = picker;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding:  EdgeInsets.only(
              left: 10,
              top: 10.0,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom
          ),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _onSubmit(),
                decoration: const InputDecoration(
                    labelText: "Titulo"
                ),
              ),
              TextField(
                controller: _valueController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _onSubmit(),
                decoration: const InputDecoration(
                    labelText: "Valor (R\$)"
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children:  [
                     Text(
                         _selectedDate == null ?
                         'Sem data selecionada' :
                         DateFormat('dd/MM/y').format(_selectedDate)),
                    TextButton(
                        onPressed: _showDatePicker,
                        child: const Text("Selecionar data",
                          style: TextStyle(color: Colors.black54),
                        ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: _onSubmit,
                      child:  const Text("Nova Transacao",
                        style: TextStyle(color: Colors.white),
                      ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

