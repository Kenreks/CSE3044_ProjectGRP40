import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback press; //FUNCTIONDAN VOIDCALLBACK YAPTIN
  final Color color, textcolor;
  const Button({
    Key? key, //buralara bak
    required this.text,
    required this.press,
    this.color = Colors.deepOrange,
    this.textcolor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: color,
          onPressed: press,
          child: Text(text,
              style: TextStyle(color: textcolor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
