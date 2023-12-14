import 'package:flutter/material.dart';

import 'base_text_input.dart';

class PasswordInput extends BaseTextInput {
  PasswordInput({
    required super.controller,
    required bool isObscureText,
    super.validator,
    String? labelText,
    VoidCallback? onPressed,
    super.key,
  }) : super(
          labelText: labelText ?? 'Password',
          icon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              isObscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        );
}
