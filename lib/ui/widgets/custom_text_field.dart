import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool isPassword;

  final String error;

  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key key,
    this.label,
    this.icon,
    this.isPassword = false,
    @required this.error,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xFFF234253), fontWeight: FontWeight.bold),
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
          errorText: error,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0)),
          labelText: label,
          labelStyle:
              TextStyle(color: Color(0xFFF234253), fontWeight: FontWeight.bold),
          suffixIcon: icon),
    );
  }
}
