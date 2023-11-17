import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

    if (!formKey.currentState!.validate()) {
      return;
    }

    // Replace this with supabase auth.
    final res = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );

    final session = res.session;
    final user = res.user;
  }

  void togglePasswordInvisible() {
    _isObscureText.value = !_isObscureText.value;
  }
}
