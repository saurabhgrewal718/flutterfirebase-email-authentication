import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loginpage.dart';
import 'signuppage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: <String,WidgetBuilder>{
        '/landingPage':(BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignupPage(), 
        '/homepage':(BuildContext context) => new HomePage(),  
        },
    );
  }
}