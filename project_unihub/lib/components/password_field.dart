import 'package:flutter/material.dart';
import 'package:project_unihub/components/text_field_container.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: Colors.deepOrangeAccent,
        ),
        suffixIcon: Icon(
          Icons.visibility,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
