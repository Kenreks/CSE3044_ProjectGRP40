import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_unihub/components/button.dart';
import 'package:project_unihub/question_controller.dart';
import 'package:project_unihub/screens/Quiz%20Game/components/constants.dart';
import 'package:flutter_svg/svg.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${10 * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 2),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.orangeAccent),
                margin: const EdgeInsets.only(bottom: 10),
                child: Button(
                    text: "Retry",
                    color: Colors.orangeAccent,
                    press: () {
                      Get.close(2);
                      Get.deleteAll();
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.orangeAccent),
                margin: const EdgeInsets.only(bottom: 150),
                child: Button(
                    text: "Menu",
                    press: () {
                      Get.close(3);
                      Get.deleteAll();
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
