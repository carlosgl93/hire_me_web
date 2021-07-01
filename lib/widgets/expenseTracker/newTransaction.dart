import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  var _selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
      _selectedDate,
    );

    // close the modal after saving the transaction:
    Navigator.pop(context);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildNewTransaction(context);
  }

  SingleChildScrollView buildNewTransaction(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
                  onSubmitted: (_) => submitData(),
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  onSubmitted: (_) => submitData(),
                ),
                SizedBox(
                  height: 5,
                ),
                // transaction save CTA
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No date chosen!'
                            : DateFormat.yMd().format(_selectedDate),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      child: Platform.isIOS
                          ? CupertinoButton(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  _selectedDate == null
                                      ? 'Choose Date'
                                      : 'Change Chosen Date',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: _presentDatePicker,
                              padding: EdgeInsets.all(5),
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor,
                            )
                          : TextButton(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  _selectedDate == null
                                      ? 'Choose Date'
                                      : 'Change Chosen Date',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: _presentDatePicker,
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(5)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).accentColor)),
                            ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: submitData,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).accentColor),
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.all(5),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
