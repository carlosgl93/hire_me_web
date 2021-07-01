import 'package:hire_me/widgets/sharedWidgets/myCupertinoApp.dart';
import 'package:hire_me/widgets/sharedWidgets/myMaterialApp.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set prefered orientations to force the user to only use certain
  // device orientation AKA Too lazy to make landscape app:
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // app defined in a separated file to keep the main file polite
    final myApp = Platform.isIOS ? MyCupertinoApp() : MyMaterialApp();
    return myApp;
  }
}
