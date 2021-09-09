import 'package:flutter/material.dart';

import 'package:hire_me/widgets/cv/myBulletPoint.dart';

class MyTile extends StatelessWidget {
  const MyTile({
    Key? key,
    required this.mq,
    required this.text,
  }) : super(key: key);

  final MediaQueryData mq;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: mq.size.width * 0.1),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Transform.translate(
          offset: Offset(0, 5),
          child: MyBulletPoint(),
        ),
        title: Transform.translate(
          offset: Offset(-30, 0),
          child: Text(text, style: Theme.of(context).textTheme.bodyText1),
        ),
      ),
    );
  }
}
