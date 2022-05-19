import 'package:flutter/material.dart';
import 'package:project_unihub/components/text_field_container.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Widget? suffixIcon;
  final ValueChanged<String> onChanged;
  const InputField({
    Key? key,
    required this.hintText, //buralar sıkıntı yapabilir
    this.icon = Icons.person,
    required this.onChanged,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
