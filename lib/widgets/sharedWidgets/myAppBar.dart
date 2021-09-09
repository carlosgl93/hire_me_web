import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyMaterialAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function appBarAction;
  final Icon appBarIcon;

  MyMaterialAppBar(this.title, this.appBarAction, this.appBarIcon);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title, style: Theme.of(context).textTheme.headline2),
            trailing: CupertinoButton(
              alignment: Alignment.center,
              child: Icon(CupertinoIcons.add),
              onPressed: () => appBarAction,
            ),
          )
        : AppBar(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => appBarAction,
                icon: appBarIcon,
              ),
            ],
          ) as PreferredSizeWidget;
  }
}
