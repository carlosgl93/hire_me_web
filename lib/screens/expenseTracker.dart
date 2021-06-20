import 'package:flutter/material.dart';
import 'package:hire_me/widgets/expenseTracker/userTransactions.dart';

class ExpenseTracker extends StatelessWidget {
  // constructor
  ExpenseTracker();

  // main functionality
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        centerTitle: true,
        actions: [
          Icon(Icons.add),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                child: Text('Chart'),
              ),
              elevation: 5,
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
