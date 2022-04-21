import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  late final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

    void _submitForm() {
      final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if(title.isEmpty || value <= 0 ){
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(
                    labelText: 'Título',
                  )),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitForm(),
                    controller: valueController,
                    decoration: InputDecoration(
                    labelText: 'Valor (R\$)',
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text('Nova transação'),
                        onPressed: _submitForm,
                        style: TextButton.styleFrom(primary: Colors.purple),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}