import 'package:universal_io/io.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hire_me/widgets/navLink.dart';
import 'package:hire_me/widgets/socialButton.dart';

class HomePage extends StatelessWidget {
  // constructor
  HomePage();

  @override
  Widget build(BuildContext context) {
    // responsiveness variable:
    final mq = MediaQuery.of(context);
    final isLandscape = mq.orientation == Orientation.landscape;

    //PreferredSizeWidget type to avoid error of preferredsizewidget
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Carlos Gumucio Labbé',
            ),
          )
        : AppBar(
            title: Text(
              'Carlos Gumucio Labbé',
            ),
            centerTitle: true,
          )) as PreferredSizeWidget;

    // Home body. profile and social links

    // adaptive scaffold

    final Widget adaptiveScaffold = Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: mq.size.height,
                      maxWidth: mq.size.width,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        Container(
                          height: (mq.size.height -
                                  appBar.preferredSize.height -
                                  mq.padding.top) *
                              0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                  './assets/images/profilepicture.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: mq.viewPadding * 0.1,
                        ),
                        Text(
                          'Acerca de mi:',
                          style: TextStyle(
                            fontSize: mq.textScaleFactor * 25,
                          ),
                        ),
                        SizedBox(
                          height: mq.size.height * 0.0100,
                        ),
                        Container(
                          margin: EdgeInsets.all(mq.size.height * 0.02),
                          padding: mq.viewPadding * 0.1,
                          child: Text(
                            'Soy un desarrollador front end que usa Flutter para desarrollar aplicaciones móviles, web y desktop.',
                          ),
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        SocialButton(
                            icon: Icons.laptop,
                            iconColor: Colors.black,
                            label: 'Mi Github'),
                        SizedBox(
                          height: mq.size.height * 0.05,
                        ),
                        SocialButton(
                            url: 'https://www.instagram.com/canogumucio/',
                            icon: Icons.photo_camera,
                            iconColor: Colors.orange,
                            label: 'Mi instagram'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: appBar,
            drawer: Drawer(
                child: Container(
              constraints: BoxConstraints(
                maxWidth: mq.size.width * 0.7,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'More from me',
                      style: TextStyle(
                        color: Theme.of(context).buttonColor,
                        fontSize: mq.textScaleFactor * 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  NavLink(title: 'What can I do for you?', route: '/solution'),
                  NavLink(title: 'Expense Tracker', route: '/expenseTracker'),
                  NavLink(title: 'Todo List', route: '/todoList'),
                  NavLink(title: 'NodeJs API', route: '/nodeJs'),
                  NavLink(title: 'Image Uploader', route: '/imageUploader'),
                ],
              ),
            )),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: mq.size.height,
                      maxWidth: mq.size.width,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        Container(
                          height: (mq.size.height -
                                  appBar.preferredSize.height -
                                  mq.padding.top) *
                              0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                  './assets/images/profilepicture.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: mq.viewPadding * 0.1,
                        ),
                        Text(
                          'Acerca de mi:',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Padding(
                          padding: mq.viewPadding * 0.1,
                        ),
                        Container(
                          margin: EdgeInsets.all(mq.size.height * 0.02),
                          padding: mq.viewPadding * 0.1,
                          child: Text(
                            'Soy un desarrollador front end que usa Flutter para desarrollar aplicaciones móviles, web y desktop.',
                          ),
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        SocialButton(
                            icon: Icons.laptop,
                            iconColor: Colors.black,
                            label: 'Mi Github'),
                        SizedBox(
                          height: mq.size.height * 0.05,
                        ),
                        SocialButton(
                            url: 'https://www.instagram.com/canogumucio/',
                            icon: Icons.photo_camera,
                            iconColor: Colors.orange,
                            label: 'Mi instagram'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );

    return adaptiveScaffold;
  }
}
