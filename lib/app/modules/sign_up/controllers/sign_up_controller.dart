import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordInvisible = true.obs;

  /// Register the user.
  Future<void> signUp() async {
    final email = emailController.text;
    final password = passwordController.text;
    final passwordConfirm = passwordConfirmController.text;

    if (!formKey.currentState!.validate()) {
      return;
    }

    // Replace this with supabase auth.
    await _signUp(email, password, passwordConfirm);
  }

  void togglePasswordInvisible() {
    passwordInvisible.value = !passwordInvisible.value;
  }

  Future<void> _signUp(
    String email,
    String password,
    String passwordConfirm,
  ) async {
    print('Email: $email');
    print('Password: $password');
    print('Password Confirm: $passwordConfirm');

    await Future<dynamic>.delayed(const Duration(seconds: 1));
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required.';
    }

    if (!GetUtils.isEmail(email)) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required.';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }

    return null;
  }

  String? validatePasswordConfirm(String? passwordConfirm) {
    if (passwordConfirm == null || passwordConfirm.isEmpty) {
      return 'Password confirmation is required.';
    }

    if (passwordConfirm != passwordController.text) {
      return 'Passwords do not match.';
    }

    return null;
  }
}
