import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
  // set prefered orientations to force the user to only use certain
  // device orientation AKA Too lazy to make landscape app:
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
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
              barBackgroundColor: Color.fromRGBO(42, 157, 143, 1),
              primaryColor: Color.fromRGBO(233, 196, 106, 1),
              primaryContrastingColor: Color.fromRGBO(38, 70, 83, 1),
              textTheme: CupertinoTextThemeData(
                primaryColor: Color.fromRGBO(42, 157, 143, 1),
                actionTextStyle: TextStyle(
                  color: Color.fromRGBO(38, 70, 83, 1),
                ),
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(244, 162, 97, 1),
                ),
              ),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Portfolio',
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                  textTheme: ThemeData.light().textTheme.copyWith(
                        title: TextStyle(
                            fontFamily: 'Kufam',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                  foregroundColor: Color.fromRGBO(254, 250, 224, 1),
                ),
                fontFamily: 'Kufam',
                primaryColor: Colors.blue,
                accentColor: Colors.orange[200],
                buttonColor: Color.fromRGBO(254, 250, 224, 1),
                textTheme: TextTheme(
                    headline1: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    headline2: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lemonada',
                        color: Colors.black),
                    bodyText1: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal))),
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
