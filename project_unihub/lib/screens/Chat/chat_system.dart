import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_unihub/screens/Chat/screens/body.dart';

class ChatSystem extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      home: ChatWelcomeScreen(),
    );
  }
}
