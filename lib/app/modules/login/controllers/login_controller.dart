import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _isPasswordVisible = false.obs;

  bool get isPasswordVisible => _isPasswordVisible.value;

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
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }
  
  /// Simulates a login request. (Delete this after implementing supabase auth.)
  Future<void> _login(String email, String password) async {
    print('Email: $email');
    print('Password: $password');

    await Future<dynamic>.delayed(const Duration(seconds: 1));
  }
}
