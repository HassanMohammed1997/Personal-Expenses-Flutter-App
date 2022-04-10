import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionInput extends StatefulWidget {
  late final Function addTransactionFunc;

  NewTransactionInput(this.addTransactionFunc);

  @override
  State<NewTransactionInput> createState() => _NewTransactionInputState();
}

class _NewTransactionInputState extends State<NewTransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) return;

    widget.addTransactionFunc(enteredTitle, enteredAmount, _selectedDate);
    //close bottom sheet
    Navigator.of(context).pop();
  }

  void _showDataPicker(BuildContext ctx) {
    showDatePicker(
            context: ctx,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Label Text'),
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => amountTitle = value,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date chosen!'
                          : "Picked date: ${DateFormat.yMMMd().format(_selectedDate!)}")),
                  OutlinedButton(
                      onPressed: () {
                        _showDataPicker(context);
                      },
                      child: const Text(
                        'Choose date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: ElevatedButton(
                onPressed: () => _submitData(),
                child: const Text("Add Transaction"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
