import 'package:flutter/material.dart';
import 'package:hire_me/models/expenseTracker/transactions.dart';
import 'package:hire_me/widgets/expenseTracker/chartBar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isLandscape = mq.orientation == Orientation.landscape;

    return isLandscape
        // if is landscape return ...
        ? Container(
            height: mq.size.height * 0.4,
            width: mq.size.width * 0.8,
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: groupedTransactionValues.map((data) {
                    return Expanded(
                      child: ChartBar(
                        (data['day'] as String),
                        (data['amount'] as double),
                        totalSpending == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalSpending,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        // if it is portrait return...
        : Container(
            height: mq.size.height * 0.4,
            width: mq.size.width * 0.8,
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: groupedTransactionValues.map((data) {
                    return Expanded(
                      child: ChartBar(
                        (data['day'] as String),
                        (data['amount'] as double),
                        totalSpending == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalSpending,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
  }
}
