import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'base_text_input.dart';

class EmailInput extends BaseTextInput {
  EmailInput({
    required super.controller,
    super.validator,
    super.key,
  }) : super(
          labelText: S.current.email,
          icon: const Icon(Icons.email),
        );
}
