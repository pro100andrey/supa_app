import 'package:flutter/material.dart';

class BaseTextInput extends StatelessWidget {
  const BaseTextInput({
    required this.controller,
    required this.labelText,
    this.icon,
    this.suffixIcon,
    this.validator,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          icon: icon,
          suffixIcon: suffixIcon,
        ),
      );
}
