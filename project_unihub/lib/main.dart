import 'package:flutter/material.dart';
import 'package:project_unihub/screens/Menu/menu_screen.dart';
import 'package:project_unihub/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'MarunHub';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          fontFamily: 'Alata',
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
      routes: {
        'menu': (BuildContext ctx) => MenuScreen(),
      },
    );
  }
}
