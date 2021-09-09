import 'package:universal_io/io.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hire_me/widgets/sharedWidgets/myDrawer.dart';
import 'package:hire_me/widgets/navLink.dart';
import 'package:hire_me/widgets/socialButton.dart';

class HomePage extends StatelessWidget {
  // constructor
  HomePage();

  @override
  Widget build(BuildContext context) {
    // responsiveness variable:
    final mq = MediaQuery.of(context);

    // //PreferredSizeWidget type to avoid error of preferredsizewidget
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            backgroundColor: Colors.blueGrey[800],
            middle: Text(
              'Carlos Gumucio Labbé',
              style: TextStyle(
                fontSize: 20,
              ),
            ))
        : AppBar(
            backgroundColor: Colors.blueGrey[800],
            title: Text('Carlos Gumucio Labbé',
                style: Theme.of(context).textTheme.headline1),
            centerTitle: true,
          )) as PreferredSizeWidget;

    // drawer

    // // Home body. profile and social links

    // adaptive scaffold

    final Widget adaptiveScaffold = Platform.isIOS
        ? buildIOSHomePage(appBar, mq, context)
        : buildAndroidHomePage(appBar, mq, context);

    return adaptiveScaffold;
  }

  final myDrawer = MyDrawer();

// android / windows scaffold
  Scaffold buildAndroidHomePage(
      PreferredSizeWidget appBar, MediaQueryData mq, BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: myDrawer,
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
                  // space between appBar and profile pic
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mq.size.width * 0.01,
                        vertical: mq.size.height * 0.01),
                  ),
                  Container(
                    height: mq.size.height * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('./assets/images/profilepicture.png'),
                      ),
                    ),
                  ),
                  // end of the profile pic
                  // more space
                  SizedBox(
                    height: mq.size.height * 0.01,
                  ),
                  // main headline
                  Text(
                    'About me:',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.justify,
                  ),
                  // more space

                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: mq.size.width * 0.1,
                      vertical: mq.size.height * 0.005,
                    ),
                    child: Text(
                      'I\'m a front end developer that uses Flutter to develop web, mobile and desktop apps.\n \n'
                      'Soy un desarrollador front end que usa Flutter para desarrollar aplicaciones móviles, web y desktop.',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(
                    height: mq.size.height * 0.015,
                  ),
                  SocialButton(
                    url: 'https://cgl-portfolio.web.app/#/cv',
                    icon: Icons.folder_open,
                    label: 'My Cv',
                  ),
                  SizedBox(
                    height: mq.size.height * 0.015,
                  ),
                  SocialButton(
                    icon: Icons.laptop,
                    label: 'My Github',
                  ),
                  SizedBox(
                    height: mq.size.height * 0.015,
                  ),
                  SocialButton(
                    url: 'https://www.instagram.com/canogumucio/',
                    icon: Icons.photo_camera,
                    label: 'My instagram',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // android and windows drawer
  Drawer buildDrawer(MediaQueryData mq, BuildContext context) {
    return Drawer(
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
          // NavLink(title: 'What can I do for you?', route: '/solution'),
          // NavLink(title: 'Expense Tracker', route: '/expenseTracker'),
          // NavLink(title: 'Meals', route: '/meals'),
          // NavLink(title: 'Todo List', route: '/todoList'),
          // NavLink(title: 'NodeJs API', route: '/nodeJs'),
          // NavLink(title: 'Image Uploader', route: '/imageUploader'),
        ],
      ),
    ));
  }
}

CupertinoPageScaffold buildIOSHomePage(
    PreferredSizeWidget appBar, MediaQueryData mq, BuildContext context) {
  return CupertinoPageScaffold(
    // appBar
    navigationBar: appBar as ObstructingPreferredSizeWidget,
    // main content
    child: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            // body main content from topbar to the footer
            constraints: BoxConstraints(
              maxHeight: mq.size.height,
              maxWidth: mq.size.width,
            ),
            // Start of the actual content
            child: Column(
              children: [
                // space between appBar and content
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mq.size.width * 0.01,
                      vertical: mq.size.height * 0.01),
                ),
                // Profile picture of me
                Container(
                  height: mq.size.height * 0.25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      image: AssetImage('./assets/images/profilepicture.png'),
                    ),
                  ),
                ),
                // finish of the profile picture
                // space separating profile picture and content
                SizedBox(
                  height: mq.size.height * 0.01,
                ),
                // main content header

                // more margin/padding
                SizedBox(
                  height: mq.size.height * 0.01,
                ),
                // about me description
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: mq.size.width * 0.1,
                    vertical: mq.size.height * 0.01,
                  ),
                  child: Text(
                    'I\'m a front end developer that uses Flutter to develop web, mobile and desktop apps.\n \n'
                    'Soy un desarrollador front end que usa Flutter para desarrollar aplicaciones web, móviles y desktop.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                // end of the description
                // more space
                SizedBox(
                  height: mq.size.height * 0.025,
                ),
                // Links to my profiles
                SocialButton(
                    icon: CupertinoIcons.device_laptop,
                    iconColor:
                        CupertinoTheme.of(context).primaryContrastingColor,
                    label: 'Github'),
                SizedBox(
                  height: mq.size.height * 0.05,
                ),
                SocialButton(
                    url: 'https://www.instagram.com/canogumucio/',
                    icon: Icons.photo_camera,
                    iconColor:
                        CupertinoTheme.of(context).primaryContrastingColor,
                    label: 'Instagram'),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
