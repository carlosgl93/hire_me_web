import 'package:flutter/material.dart';

class MyBulletPoint extends StatelessWidget {
  const MyBulletPoint({
    Key? key,
    String? title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      // padding: EdgeInsets.only(left: 20),
      height: 6.0,
      width: 6.0,
      decoration: new BoxDecoration(
        color: Colors.blueGrey[900],
        shape: BoxShape.circle,
      ),
    );
  }
}
