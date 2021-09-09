import 'package:flutter/material.dart';
import 'package:hire_me/widgets/sharedWidgets/myMaterialScaffold.dart';

class ChatList extends StatefulWidget {
  static const routeName = '/matches';
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return MyMaterialScaffold(
      'Matches',
      Container(
          child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 15,
            ),
            title: Text('Miel'),
          )
        ],
      )),
    );
  }
}
