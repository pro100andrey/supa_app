import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _isObscureText = true.obs;

  bool get isObscureText => _isObscureText.value;

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

  void togglePasswordInvisible() {
    _isObscureText.value = !_isObscureText.value;
  }

  /// Simulates a login request. (Delete this after implementing supabase auth.)
  Future<void> _login(String email, String password) async {
    debugPrint('Email: $email');
    debugPrint('Password: $password');

    await Future<dynamic>.delayed(const Duration(seconds: 1));
  }
}
