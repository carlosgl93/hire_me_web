import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hire_me/screens/homepage.dart';
import 'package:hire_me/screens/imageUploader.dart';
import 'package:hire_me/screens/service.dart';
import 'package:hire_me/screens/notFound.dart';
import 'package:hire_me/screens/nodeJs.dart';
import 'package:hire_me/screens/todoList.dart';
import 'package:hire_me/screens/expenseTracker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Portfolio',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
                headline1: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                headline2:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
        });
  }
}
