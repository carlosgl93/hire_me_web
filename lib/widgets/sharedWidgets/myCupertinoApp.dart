import 'package:flutter/cupertino.dart';

import 'package:hire_me/screens/expenseTracker.dart';
import 'package:hire_me/screens/homepage.dart';
import 'package:hire_me/screens/notFound.dart';
import 'package:hire_me/screens/nodeJs.dart';
import 'package:hire_me/screens/imageUploader.dart';
import 'package:hire_me/screens/service.dart';
import 'package:hire_me/screens/todoList.dart';

class MyCupertinoApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/todoList': (context) => TodoList(),
        '/nodeJs': (context) => NodeJs(),
        '/imageUploader': (context) => ImageUploader(),
        '/solution': (context) => Solution(),
        '/expenseTracker': (context) => ExpenseTracker(),
        '/notFound': (context) => NotFound(),
      },
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(244, 244, 245, 1),
        barBackgroundColor: Color.fromRGBO(255, 223, 96, 1),
        primaryColor: Color.fromRGBO(255, 223, 96, 1),
        primaryContrastingColor: Color.fromRGBO(124, 175, 196, 1),
        textTheme: CupertinoTextThemeData(
          primaryColor: Color.fromRGBO(255, 255, 255, 1),
          actionTextStyle: TextStyle(
            color: Color.fromRGBO(76, 92, 104, 1),
          ),
          textStyle: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(72, 61, 63, 1),
          ),
        ),
      ),
    );
  }
}
