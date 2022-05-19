import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Image.asset('assets/images/background.png',
            height: 1000, fit: BoxFit.fitHeight),
        Positioned(
          top: 70,
          left: 110,
          child: Image.asset(
            'assets/images/uni.png',
            width: size.width * 0.4,
          ),
        ),
        child,
      ]),
    );
  }
}
