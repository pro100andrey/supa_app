import 'package:get/get.dart';

/// Validates the email.
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required.';
    }

    if (!GetUtils.isEmail(email)) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  /// Validates the password.
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required.';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    return null;
  }

  /// Validates the password confirmation.
  String? validatePasswordConfirm(String? password, String? passwordConfirm,) {
    if (passwordConfirm == null || passwordConfirm.isEmpty) {
      return 'Password confirmation is required.';
    }

    if (passwordConfirm != password) {
      return 'Passwords do not match.';
    }

    return null;
  }
