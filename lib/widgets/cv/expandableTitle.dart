import 'package:flutter/material.dart';

class ExpandableTitle extends StatelessWidget {
  const ExpandableTitle({
    Key? key,
    required this.mq,
    required this.title,
    required this.subtitle,
    required this.subSubtitle,
    required this.isOpen,
  }) : super(key: key);

  final MediaQueryData mq;
  final String title;
  final String subtitle;
  final String subSubtitle;
  final bool isOpen;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title of the extract
        Container(
          padding: EdgeInsets.symmetric(
            vertical: mq.size.height * 0.01,
            horizontal: mq.size.width * 0.1,
          ),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: mq.textScaleFactor * 25,
            ),
          ),
          color: Colors.white,
          height: mq.size.height * 0.06,
          width: mq.size.width * 0.8,
        ),
        // subtitle of the extract
        isOpen
            ? Container()
            : Container(
                padding: EdgeInsets.only(left: mq.size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subtitle,
                        style: Theme.of(context).textTheme.headline2),
                    Text(subSubtitle,
                        style: Theme.of(context).textTheme.headline3),
                  ],
                ),
                height: mq.size.height * 0.08,
                width: mq.size.width * 0.8,
                color: Colors.white,
              )
      ],
    );
  }
}
