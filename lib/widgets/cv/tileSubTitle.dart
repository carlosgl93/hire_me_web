import 'package:flutter/material.dart';

class TileSubTitle extends StatelessWidget {
  const TileSubTitle({Key? key, required this.mq, required this.subTitle})
      : super(key: key);

  final MediaQueryData mq;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
        fontSize: mq.textScaleFactor * 16,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[900],
      ),
    );
  }
}
