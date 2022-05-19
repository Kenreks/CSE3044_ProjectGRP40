import 'package:flutter/material.dart';
import 'package:project_unihub/screens/Menu/components/body.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(resizeToAvoidBottomInset: false, body: Body()));
  }
}
