import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback press; //FUNCTIONDAN VOIDCALLBACK YAPTIN
  final Color color, iconcolor;
  const MenuButton({
    Key? key, //buralara bak
    required this.icon,
    required this.press,
    this.color = Colors.deepOrange,
    this.iconcolor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: IconButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: color,
          onPressed: press,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
