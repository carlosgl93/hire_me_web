import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:hire_me/models/expenseTracker/transactions.dart';

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
                return Card(
                  margin: EdgeInsets.all(6),
                  child: ListTile(
                      // remove transaction CTA
                      trailing: mq.size.width > 400
                          ? TextButton.icon(
                              icon: Icon(Icons.delete_outline_outlined),
                              label: Text('Remove'),
                              onPressed: () =>
                                  deleteTransaction(transactions[index].id),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).accentColor,
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.delete_forever_outlined,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () =>
                                  deleteTransaction(transactions[index].id),
                            ),
                      minVerticalPadding: 5,
                      // date string of the transaction
                      subtitle: Text(
                          DateFormat.yMMMMd().format(transactions[index].date)),
                      // amount of the transaction
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        ),
                      ),
                      // title of the transaction
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                );
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
