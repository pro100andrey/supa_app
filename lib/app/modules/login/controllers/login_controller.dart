import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  /// Logs the user in.
  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!formKey.currentState!.validate()) {
      return;
    }

    // Replace this with supabase auth.
    await _login(email, password);
  }

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

  /// Simulates a login request. (Delete this after implementing supabase auth.)
  Future<void> _login(String email, String password) async {
    print('Email: $email');
    print('Password: $password');

    await Future<dynamic>.delayed(const Duration(seconds: 1));
  }
}
