import 'package:flutter/material.dart';
import 'package:movieapp/components/text_field_container.dart';

import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({Key key, this.onChanged, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
