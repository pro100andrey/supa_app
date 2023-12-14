import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final _isBusy = false.obs;
  bool get isBusy => _isBusy.value;

  final _isObscureText = true.obs;
  bool get isObscureText => _isObscureText.value;

  /// Logs the user in.
  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!formKey.currentState!.validate()) {
      return;
    }
    _isBusy.value = true;
    update();
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } finally {
      _isBusy.value = false;
      update();
    }
  }

  void togglePasswordInvisible() {
    _isObscureText.value = !_isObscureText.value;
  }
}
