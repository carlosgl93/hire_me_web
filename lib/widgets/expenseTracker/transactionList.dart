import 'package:flutter/material.dart';

import 'package:hire_me/models/expenseTracker/transactions.dart';
import 'transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    // variable to instantiate later for MediaQuery object, this is better for performance
    // and clean code good practice.
    final mq = MediaQuery.of(context);
    return Container(
      constraints: BoxConstraints.loose(
        Size.fromWidth(mq.size.width * 0.8),
      ),
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('./assets/images/noTransactions.png'),
                  ),
                ),
              );
            })
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(
                    mq: mq,
                    deleteTransaction: deleteTransaction,
                    transaction: transactions[index]);
                // return Card(
                //   child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Container(
                //           margin: EdgeInsets.symmetric(
                //               vertical: 10, horizontal: 15),
                //           decoration: BoxDecoration(
                //             color: Theme.of(context).primaryColor,
                //             border: Border.all(
                //               color: Colors.grey,
                //               width: 1,
                //             ),
                //           ),
                //           padding: EdgeInsets.all(10),
                //           alignment: Alignment.center,
                //           child: Text(
                //             '\$ ${transactions[index].amount.toStringAsFixed(3)}',
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 15,
                //                 color: Colors.white),
                //           ),
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               transactions[index].title,
                //               style: Theme.of(context).textTheme.headline2,
                //             ),
                //             Text(
                //                 DateFormat('dd-MM-yyyy')
                //                     .format(transactions[index].date),
                //                 style: TextStyle(
                //                   fontSize: 10,
                //                   fontWeight: FontWeight.w100,
                //                 )),
                //           ],
                //         ),
                //       ]),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
