import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_unihub/screens/Menu/menu_screen.dart';
import 'package:project_unihub/screens/Quiz%20Game/quiz_welcome_screen.dart';
import 'package:project_unihub/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'MarunHub';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _title,
      theme: ThemeData(
          fontFamily: 'Alata',
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
      routes: {
        'menu': (context) => MenuScreen(),
      },
      getPages: [
        GetPage(name: '/menu', page: () => MenuScreen()),
        GetPage(name: '/quiz', page: () => QuizWelcomeScreen()),
      ],
    );
  }
}
