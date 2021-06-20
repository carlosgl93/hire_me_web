import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:hire_me/models/expenseTracker/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  '\$ ${transactions[index].amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactions[index].title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      DateFormat('dd-MM-yyyy').format(transactions[index].date),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      )),
                ],
              ),
            ]),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
