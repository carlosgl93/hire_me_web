import 'package:flutter/material.dart';
import 'package:hire_me/screens/cVitae.dart';
import 'package:hire_me/screens/expenseTracker.dart';
import 'package:hire_me/screens/form.dart';
import 'package:hire_me/screens/homepage.dart';
import 'package:hire_me/screens/imageUploader.dart';
import 'package:hire_me/screens/nodeJs.dart';
import 'package:hire_me/screens/petTinder.dart';
import 'package:hire_me/screens/todoList.dart';
import 'package:hire_me/screens/tribute.dart';
import '../navLink.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Drawer(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: mq.size.width * 0.7,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'More from me',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            NavLink(
              'Home',
              HomePage(),
            ),
            NavLink(
              'My Cv',
              CurriculumScreen(),
            ),
            NavLink(
              'Tribute Page 1st Project',
              TributePage(),
            ),
            NavLink(
              'Form Page 2nd Project',
              FormPage(),
            ),
            NavLink(
              'Todo List',
              TodoList(),
            ),
            NavLink(
              'Expense Tracker',
              ExpenseTracker(),
            ),
            NavLink(
              'Pet Tinder',
              PetTinder(),
            ),
            NavLink(
              'NodeJs API',
              NodeJs(),
            ),
            NavLink(
              'Image Uploader',
              ImageUploader(),
            ),
          ],
        ),
      ),
    );
  }
}
