import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  final bool obscureText;
  final TextInputType textInputType;
  final IconData icon;
  final Color colorIcon;
  final String hintText, errorText;
  const FieldForm({@required this.obscureText, @required this.textInputType, @required this.icon, @required this.colorIcon, @required this.hintText, @required this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: colorIcon,
        ),
        hintText: hintText,
        errorText: errorText,
      ),
    );
  }
}