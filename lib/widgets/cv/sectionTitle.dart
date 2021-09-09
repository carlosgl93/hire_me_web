import 'package:flutter/material.dart';

import './tileTitle.dart';
import './tileSubTitle.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.mq,
    required this.tileTitle,
    required this.tileSubTitle,
  }) : super(key: key);

  final MediaQueryData mq;
  final String tileTitle;
  final String tileSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: mq.size.height * 0.01,
        horizontal: mq.size.width * 0.02,
      ),
      alignment: AlignmentDirectional.topCenter,
      child: Column(
        children: [
          TileTitle(
            mq: mq,
            title: tileTitle,
          ),
          SizedBox(
            height: mq.size.height * 0.01,
          ),
          TileSubTitle(
            mq: mq,
            subTitle: tileSubTitle,
          ),
        ],
      ),
      color: Colors.orange[100],
    );
  }
}
