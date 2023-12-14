import 'package:flutter/material.dart';

import 'base_text_input.dart';

class EmailInput extends BaseTextInput {
  const EmailInput({
    required super.controller,
    super.validator,
    super.key,
  }) : super(
          labelText: 'Email',
          icon: const Icon(Icons.email),
        );
}
