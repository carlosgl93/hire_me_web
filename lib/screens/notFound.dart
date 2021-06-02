import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
          'error: 404 - The page you are looking for has not been created yet!'),
    ));
  }
}
