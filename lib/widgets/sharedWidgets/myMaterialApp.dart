import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_me/screens/cVitae.dart';
import '../../screens/form.dart';
import '../../models/controllers/formController.dart';
import 'package:hire_me/screens/categoryScreen.dart';
import 'package:hire_me/screens/expenseTracker.dart';
import 'package:hire_me/screens/form.dart';
import 'package:hire_me/screens/homepage.dart';
import 'package:hire_me/screens/meals/mealDetails.dart';
import 'package:hire_me/screens/notFound.dart';
import 'package:hire_me/screens/nodeJs.dart';
import 'package:hire_me/screens/imageUploader.dart';
import 'package:hire_me/screens/petTinder.dart';
import 'package:hire_me/screens/service.dart';
import 'package:hire_me/screens/todoList.dart';
import 'package:hire_me/screens/tribute.dart';
import 'package:hire_me/widgets/meals/tabNav.dart';
import 'package:hire_me/widgets/petTinder/candidateDetail.dart';
import 'package:hire_me/widgets/petTinder/chatListView.dart';

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        fontFamily: 'Raleway',
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
        primaryColor: Colors.orange[200],
        accentColor: Colors.blueGrey[800],
        buttonColor: Color.fromRGBO(254, 250, 224, 1),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Kufam',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontFamily: 'Kufam',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[900],
          ),
          headline3: TextStyle(
            fontFamily: 'Kufam',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[900],
          ),
          bodyText1: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.blueGrey[900]),
          bodyText2: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/cv',
          page: () => CurriculumScreen(),
        ),
        GetPage(
          name: '/tribute',
          page: () => TributePage(),
        ),
        GetPage(
          name: '/form',
          page: () => FormPage(),
        ),
        GetPage(
          name: '/todo',
          page: () => TodoList(),
        ),
        GetPage(
          name: '/expenseTracker',
          page: () => ExpenseTracker(),
        ),
        GetPage(
          name: '/petTinder',
          page: () => PetTinder(),
        ),
        GetPage(
          name: '/nodeJs',
          page: () => NodeJs(),
        ),
        GetPage(
          name: '/imageUploader',
          page: () => ImageUploader(),
        ),
      ],
      routes: {
        '/': (context) => HomePage(),
        '/cv': (context) => CurriculumScreen(),
        '/todoList': (context) => TodoList(),
        '/tribute': (context) => TributePage(),
        // '/form': (context) => MyForm();
        '/nodeJs': (context) => NodeJs(),
        '/imageUploader': (context) => ImageUploader(),
        '/solution': (context) => Solution(),
        '/expenseTracker': (context) => ExpenseTracker(),
        '/meals': (context) => TabNav(),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        MealDetails.routeName: (context) => MealDetails(),
        '/petTinder': (context) => PetTinder(),
        CandidateDetail.routeName: (context) => CandidateDetail(),
        ChatList.routeName: (context) => ChatList(),
        '/notFound': (context) => NotFound(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => NotFound(),
        );
      },
    );
  }
}
