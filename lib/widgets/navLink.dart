import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hire_me/screens/expenseTracker.dart';

class NavLink extends StatelessWidget {
  String? title;
  Widget? screen;

  NavLink(this.title, this.screen);

  @override
  Widget build(BuildContext context) {
    // responsiveness variable && platform
    final mq = MediaQuery.of(context);

    // function to nav
    //final void goToRoute = (route) => Navigator.pushNamed(context, route);
    // function for the nav stopped working, dont know why yet.

    return ListTile(
      focusColor: Color.fromRGBO(221, 161, 94, 1),
      hoverColor: Theme.of(context).primaryColor,

      title: Text(
        title as String,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      // re route funtion in an anonymous func
      onTap: () {
        // Navigator.pushNamed(context, route);
        Get.to(screen);
      },
    );
  }
}
