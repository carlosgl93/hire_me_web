import 'package:flutter/material.dart';

import './myAppBar.dart';
import './myDrawer.dart';

class MyMaterialScaffold extends StatelessWidget {
  final String scaffoldTitle;
  final Widget child;
  MyMaterialScaffold(this.scaffoldTitle, this.child);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyMaterialAppBar(
        scaffoldTitle,
        () {},
        Icon(Icons.favorite_border_outlined),
      ),
      drawer: MyDrawer(),
      body: SafeArea(child: child),
    );
  }
}
