// import 'package:universal_io/io.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class MyAppBar extends StatelessWidget {
//   final String title;
//   final Function appBarAction;

//   MyAppBar(this.title, this.appBarAction);

//   @override
//   Widget build(BuildContext context) {
//     final mq = MediaQuery.of(context);
//     final isLandscape = mq.orientation == Orientation.landscape;

//     //PreferredSizeWidget type to avoid error of preferredsizewidget
//     final PreferredSizeWidget appBar = (Platform.isIOS
//         ? CupertinoNavigationBar(
//             middle: Text(
//               title,
//             ),
//             trailing: CupertinoButton(
//               alignment: Alignment.center,
//               child: Icon(CupertinoIcons.add),
//               onPressed: () => _startAddNewTransaction(context),
//             ),
//           )
//         : AppBar(
//             title: Text(
//               title,
//             ),
//             centerTitle: true,
//             actions: [
//               IconButton(
//                 onPressed: () => _startAddNewTransaction(context),
//                 icon: Icon(Icons.add),
//               ),
//             ],
//           )) as PreferredSizeWidget;
//     return appBar;
//   }
// }
