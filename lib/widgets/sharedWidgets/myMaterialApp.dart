import 'package:flutter/material.dart';

import 'package:hire_me/screens/expenseTracker.dart';
import 'package:hire_me/screens/homepage.dart';
import 'package:hire_me/screens/notFound.dart';
import 'package:hire_me/screens/nodeJs.dart';
import 'package:hire_me/screens/imageUploader.dart';
import 'package:hire_me/screens/service.dart';
import 'package:hire_me/screens/todoList.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline1: TextStyle(
                      fontFamily: 'Kufam',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
            foregroundColor: Color.fromRGBO(254, 250, 224, 1),
          ),
          primaryColor: Colors.blue,
          accentColor: Colors.orange[500],
          buttonColor: Color.fromRGBO(254, 250, 224, 1),
          textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange[400],
              ),
              headline2: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              bodyText1:
                  TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal))),
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
    );
  }
}
