import 'package:universal_io/io.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hire_me/widgets/expenseTracker/newTransaction.dart';
import 'package:hire_me/widgets/expenseTracker/transactionList.dart';
import '../../models/expenseTracker/transactions.dart';
import 'package:hire_me/widgets/expenseTracker/Chart.dart';

class ExpenseTracker extends StatefulWidget {
  // constructor
  ExpenseTracker();

  @override
  _ExpenseTrackerState createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  // include the transaction model
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Gas',
      amount: 20.990,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Phone repairment tools',
      amount: 14.490,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'P30 Screen Replacement',
      amount: 29.990,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Iphone 7',
      amount: 150.000,
      date: DateTime.now(),
    ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (modalContext) {
          return NewTransaction(_addNewTransaction);
        });
  }

// optimizing the main build method extracting between landscape and portrait
  Widget _buildLandscapeContent(MediaQueryData mq, PreferredSizeWidget appBar,
      Widget transactionListWidget) {
    // toggle chart shown or not
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text('Show Chart',
              style: TextStyle(
                fontSize: mq.textScaleFactor * 15,
                fontWeight: FontWeight.bold,
              )),
        ),
        Switch.adaptive(
          value: _showChart,
          onChanged: (val) {
            setState(() {
              _showChart = val;
            });
          },
        ),
        _showChart
            ? Container(
                height: mq.size.height * 0.9,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Chart(_recentTransactions),
                    transactionListWidget,
                  ]),
                ),
              )
            : transactionListWidget
      ],
    );
  }

  List<Widget> _buildPortraitContent(MediaQueryData mq,
      PreferredSizeWidget appBar, Widget transactionListWidget) {
    return [
      Container(
        height:
            (mq.size.height - appBar.preferredSize.height - mq.padding.bottom) *
                0.4,
        child: Chart(_recentTransactions),
      ),
      transactionListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isLandscape = mq.orientation == Orientation.landscape;

    //PreferredSizeWidget type to avoid error of preferredsizewidget
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Expense Tracker',
              style: TextStyle(color: Colors.white),
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.only(bottom: mq.size.height * 0.005),
              alignment: Alignment.center,
              child: Icon(
                CupertinoIcons.add,
                color: Colors.white,
              ),
              onPressed: () => _startAddNewTransaction(context),
            ),
          )
        : AppBar(
            title: Text(
              'Expense Tracker',
              style: TextStyle(
                fontSize: mq.textScaleFactor * 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add),
              ),
            ],
          )) as PreferredSizeWidget;

    // trasactionList widget
    final transactionListWidget = Container(
      height:
          (mq.size.height - appBar.preferredSize.height - mq.padding.top) * 0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    // body of the scaffolds to render depending on the platform

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              _buildLandscapeContent(mq, appBar, transactionListWidget),
            // chart container
            if (!isLandscape)
              ..._buildPortraitContent(
                mq,
                appBar,
                // transaction lists
                transactionListWidget,
              ),
          ],
        ),
      ),
    );

    // appBar casted as obstructingPreferredSizeWidget to match Cupertino
    // type expected by the navigationBar.

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar as ObstructingPreferredSizeWidget,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
          );
  }
}
