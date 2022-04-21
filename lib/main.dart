import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tala/home.dart';
import 'package:tala/login.dart';
import 'package:tala/splashscreen.dart';
import 'package:tala/utilities/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Semeron,Accedez a la parole de Dieu tous les matins',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'Ubuntu',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Container(
          child: SplashScreen(
              seconds: 3,
              navigateAfterSeconds: Splash(),
              title: new Text(
                '',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              // image: new Image.asset("assets/images/icon.png"),
              imageBackground: AssetImage('assets/images/animation.gif'),
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              // onClick: () => print("Flutter Egypt"),
              loaderColor: Colors.blue),
        ));
  }
}
