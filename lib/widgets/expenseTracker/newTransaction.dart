import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // transaction title input
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  icon: Icon(Icons.short_text),
                  labelText: 'Expense title',
                ),
                autofocus: true,
                enableSuggestions: true,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
              ),
              // transaction amount input
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  icon: Icon(Icons.money),
                  labelText: 'Expense amount',
                ),
                autofocus: true,
                enableSuggestions: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              // transaction save CTA
              TextButton(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  addTx(titleController.text,
                      double.parse(amountController.text));
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.all(5),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
