import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project_unihub/auth.dart';
import 'package:project_unihub/components/menu_button.dart';
import 'package:project_unihub/screens/Attendance/qr_screen.dart';
import 'package:project_unihub/screens/Chat/chat_system.dart';
import 'package:project_unihub/screens/Chat/screens/body.dart';
import 'package:project_unihub/screens/Chatv2/group_chat_screen.dart';
import 'package:project_unihub/screens/Login/components/body.dart';
import 'package:project_unihub/screens/Menu/components/background.dart';
import 'package:project_unihub/screens/Menu/menu_screen.dart';
import 'package:project_unihub/screens/Quiz%20Game/quiz_screen.dart';
import 'package:project_unihub/screens/Quiz%20Game/quiz_welcome_screen.dart';
import 'package:project_unihub/screens/welcome_screen.dart';
import 'package:toast/toast.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration =
      const Duration(milliseconds: 300); //animation duration
  late AnimationController _controller;
  late Animation<double> _scaleanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleanimation = Tween<double>(begin: 1, end: 0.4).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Background(
      child: Stack(
        children: <Widget>[menu(context), dashboard(context)],
      ),
    );
  }

  Widget menu(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                bool isNewRouteSameAsCurrent = false;

                Navigator.popUntil(context, (route) {
                  if (route.settings.name == 'menu') {
                    isNewRouteSameAsCurrent = true;
                  }
                  return true;
                });

                if (!isNewRouteSameAsCurrent) {
                  Navigator.pushNamed(context, 'menu');
                }
              },
              child: Text("Menu",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
            ),
            TextButton(
                onPressed: () {
                  Toast.show("Logged out");
                  Auth().logout();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }));
                },
                child: Text("Logout",
                    style: TextStyle(color: Colors.black, fontSize: 25))),
          ],
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0, //screen animation
      bottom: 0,
      left: isCollapsed ? 0 : 0.4 * screenWidth,
      right: isCollapsed ? 0 : -0.3 * screenWidth,
      child: Material(
        animationDuration: duration,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        elevation: 8,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: Icon(Icons.menu, color: Colors.orange),
                    onTap: () {
                      setState(() {
                        if (isCollapsed) {
                          _controller.forward();
                        } else {
                          _controller.reverse();
                        }
                        isCollapsed = !isCollapsed;
                      });
                    },
                  ),
                  Text("MARUNHUB",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Icon(Icons.settings),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                /* child: Text(
                  /* "Welcome " + registration.getUserName() + "!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), */
                  "Welcome " +  Auth().getFullname(Auth().getUid())+ "!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ), */
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                child: InkWell(
                  child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.only(
                          left: 20, right: 100, top: 1, bottom: 35),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 10, color: Colors.orangeAccent),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(
                                  Icons.qr_code,
                                  size: 70,
                                ),
                                onPressed: () {
                                  Toast.show("Qr Reader");
                                },
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "QR READER\nAttendace\nSystem",
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QrReader();
                    }));
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: InkWell(
                  child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.only(
                          left: 20, right: 80, top: 1, bottom: 35),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 10, color: Colors.orangeAccent),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(
                                  Icons.gamepad,
                                  size: 70,
                                ),
                                onPressed: () {
                                  Toast.show("Quiz Game");
                                },
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "QUIZ GAME\nQuestions from\nLectures",
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  onTap: () {
                    Get.to(() => QuizWelcomeScreen());
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: InkWell(
                  child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.only(
                          left: 20, right: 90, top: 1, bottom: 20),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 10, color: Colors.orangeAccent),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(
                                  Icons.chat,
                                  size: 70,
                                ),
                                onPressed: () {
                                  Toast.show("Chat");
                                },
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "CHAT\nKeep in touch\nWith other\nStudents",
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  onTap: () {
                    /* Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatSystem())); */
                    /* Get.to(ChatWelcomeScreen()); */
                    Get.to(GroupChatHomeScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
