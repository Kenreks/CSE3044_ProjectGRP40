import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_unihub/screens/Menu/menu_screen.dart';
import 'package:project_unihub/screens/Quiz%20Game/quiz_welcome_screen.dart';

class QuizGame extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: QuizWelcomeScreen(),
      getPages: [GetPage(name: '/menu', page: () => MenuScreen())],
    );
  }
}
