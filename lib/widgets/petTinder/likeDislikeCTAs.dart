import 'package:flutter/material.dart';

class LikeDislikeCTAs extends StatelessWidget {
  const LikeDislikeCTAs({
    Key? key,
    required this.mq,
  }) : super(key: key);

  final MediaQueryData mq;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          // function to reject candidate
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.do_not_disturb,
              color: Colors.red,
              size: mq.size.height * 0.1,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        // function to like candidate
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.favorite,
              color: Colors.green,
              size: mq.size.height * 0.1,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ],
    );
  }
}
