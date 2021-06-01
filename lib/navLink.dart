import 'package:flutter/material.dart';

class NavLink extends StatelessWidget {
  const NavLink({Key? key, this.title = 'link here', this.route = 'homepage'})
      : super(key: key);

  final String title;
  final String route;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        onTap: () {
          // go to route ... Navigator.push(context, route)
          // close the nav after navigating
          Navigator.pop(context);
        });
  }
}
