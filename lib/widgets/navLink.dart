import 'package:flutter/material.dart';

class NavLink extends StatelessWidget {
  final String title;
  final String route;

  NavLink({this.title = 'link here', this.route = '/notFound'});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        onTap: () {
          // go to route ... Navigator.push(context, route)
          Navigator.pushNamed(context, route);
          // close the nav after navigating
          // Navigator.pop(context);
        });
  }
}
