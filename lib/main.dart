import 'package:flutter/material.dart';
import 'package:vifi_meet/screens/homepage.dart';
import 'package:vifi_meet/screens/introauthscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSigned == false ? IntroAuthScreen() : HomePage(),
    );
  }
}
