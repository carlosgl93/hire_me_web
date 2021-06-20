import 'package:flutter/material.dart';
import 'package:hire_me/widgets/expenseTracker/newTransaction.dart';
import 'package:hire_me/widgets/expenseTracker/transactionList.dart';
import '../../models/expenseTracker/transactions.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // include the transaction model
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Gas',
      amount: 20.999,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Phone repairment tools',
      amount: 14.599,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'P30 Screen Replacement',
      amount: 30.259,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Iphone 7',
      amount: 150.333,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
