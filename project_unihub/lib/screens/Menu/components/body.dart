import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:project_unihub/components/menu_button.dart';
import 'package:project_unihub/screens/Menu/components/background.dart';
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
    _controller..dispose();
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
      padding: const EdgeInsets.only(left: 1),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                print("dashhh");
              },
              child: Text("Dashboard",
                  style: TextStyle(color: Colors.black, fontSize: 22)),
            ),
            TextButton(
              onPressed: () {
                print("profile");
              },
              child: Text("Profile",
                  style: TextStyle(color: Colors.black, fontSize: 22)),
            ),
            TextButton(
                onPressed: () {
                  Toast.show("Logged out");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }));
                },
                child: Text("Logout",
                    style: TextStyle(color: Colors.black, fontSize: 22))),
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
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.settings),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                child: PageView(
                  controller: PageController(viewportFraction: 0.8),
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.black,
                      width: 100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
