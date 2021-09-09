import 'package:flutter/material.dart';

import 'package:hire_me/widgets/petTinder/candidatesStack.dart';
import 'package:hire_me/widgets/petTinder/chatListView.dart';
import 'package:hire_me/widgets/petTinder/likeDislikeCTAs.dart';
import '../widgets/sharedWidgets/myAppBar.dart';

class PetTinder extends StatelessWidget {
  const PetTinder({Key? key}) : super(key: key);

  void goToChats(BuildContext context) {
    Navigator.of(context).pushNamed(
      ChatList.routeName,
    );
  }

  void likeCandidate() {}

  void dislikeCandidate() {}

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
        appBar: MyMaterialAppBar(
          'Pet Tinder',
          goToChats,
          Icon(Icons.message),
        ),
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CandidatesStack(),
                LikeDislikeCTAs(mq: mq),
              ],
            ),
          ),
        ));
  }
}
