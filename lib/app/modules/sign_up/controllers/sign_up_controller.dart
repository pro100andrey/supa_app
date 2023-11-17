import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final _isObscureText = true.obs;
  bool get isObscureText => _isObscureText.value;

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
    _isObscureText.value = !_isObscureText.value;
  }

  Future<void> _signUp(
    String email,
    String password,
    String passwordConfirm,
  ) async {
    debugPrint('Email: $email');
    debugPrint('Password: $password');
    debugPrint('Password Confirm: $passwordConfirm');

    await Future<dynamic>.delayed(const Duration(seconds: 1));
  }
}
