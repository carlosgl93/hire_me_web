import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hire_me/screens/expenseTracker.dart';

class NavLink extends StatelessWidget {
  final String title;
  final String route;

  NavLink({this.title = 'link here', this.route = '/notFound'});

  @override
  Widget build(BuildContext context) {
    // responsiveness variable && platform
    final mq = MediaQuery.of(context);

    // function to nav
    //final void goToRoute = (route) => Navigator.pushNamed(context, route);
    // function for the nav stopped working, dont know why yet.

    return ListTile(
      focusColor: Color.fromRGBO(221, 161, 94, 1),
      hoverColor: Theme.of(context).accentColor,

      title: Text(
        title,
        style: TextStyle(
            fontSize: mq.textScaleFactor * 15,
            color: Colors.black,
            fontWeight: FontWeight.normal),
      ),
      // re route funtion in an anonymous func
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}
