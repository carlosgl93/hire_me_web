import 'package:flutter/material.dart';

class TileTitle extends StatelessWidget {
  const TileTitle({Key? key, required this.mq, required this.title})
      : super(key: key);

  final MediaQueryData mq;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: mq.textScaleFactor * 18,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[900],
      ),
    );
  }
}
