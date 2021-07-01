import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyMaterialAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function appBarAction;

  MyMaterialAppBar(this.title, this.appBarAction);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              title,
            ),
            trailing: CupertinoButton(
              alignment: Alignment.center,
              child: Icon(CupertinoIcons.add),
              onPressed: () => appBarAction,
            ),
          )
        : AppBar(
            title: Text(
              title,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => appBarAction,
                icon: Icon(
                  Icons.add,
                ),
              ),
            ],
          );
  }
}
