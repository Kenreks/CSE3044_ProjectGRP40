import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_unihub/question_controller.dart';
import 'package:project_unihub/screens/Quiz%20Game/components/constants.dart';
import 'package:project_unihub/screens/Quiz%20Game/questions_screen.dart';
import 'package:toast/toast.dart';

final items = [
  'Software Engineering',
  'Algorithm Analysis',
  'Computer Networks'
];

class QuizWelcomeScreen extends StatefulWidget {
  @override
  State<QuizWelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<QuizWelcomeScreen> {
  QuestionController questionController = QuestionController();
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "Quiz Game",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(), // 1/6
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black, width: 4)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: value,
                            isExpanded: true,
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) =>
                                setState(() => this.value = value.toString())),
                      ),
                    ),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () {
                      if (value == null) {
                        Toast.show("Please select a lecture");
                      } else {
                        questionController.set = value!;
                        Get.to(() => QuestionsScreen());
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
