import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/expenseTracker/transactions.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.mq,
    required this.deleteTransaction,
    required this.transaction,
  }) : super(key: key);

  final MediaQueryData mq;
  final deleteTransaction;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(6),
      child: ListTile(
        // remove transaction CTA
        trailing: mq.size.width > 400
            ? TextButton.icon(
                icon: Icon(Icons.delete_outline_outlined),
                label: Text('Remove'),
                onPressed: () => deleteTransaction(transaction.id),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).accentColor,
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => deleteTransaction(transaction.id),
              ),
        minVerticalPadding: 5,
        // date string of the transaction
        subtitle: Text(DateFormat.yMMMMd().format(transaction.date)),
        // amount of the transaction
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        // title of the transaction
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
