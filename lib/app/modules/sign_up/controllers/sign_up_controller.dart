import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _isPasswordVisible = false.obs;

  bool get isPasswordVisible => _isPasswordVisible.value;

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
    _isPasswordVisible.value = !_isPasswordVisible.value;
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
}
