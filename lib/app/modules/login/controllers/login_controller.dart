import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool get isBusy => _isBusy.value;
  final  _isBusy = false.obs;

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

    await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    _isBusy.value = false;
  }

  void togglePasswordInvisible() {
    _isObscureText.value = !_isObscureText.value;
  }
}
