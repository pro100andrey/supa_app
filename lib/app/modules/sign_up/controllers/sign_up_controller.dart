import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/ui/snack/snack.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final _isBusy = false.obs;
  bool get isBusy => _isBusy.value;

  final _isObscureText = true.obs;
  bool get isObscureText => _isObscureText.value;

  /// Register the user.
  Future<void> signUp() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!formKey.currentState!.validate()) {
      return;
    }

    _isBusy.value = true;
    try {
      final res = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      if (res.user!.identities!.isEmpty) {
        throw Exception('Email exists already. Try type another email');
      }
    } on AuthException catch (e) {
      warningToast(e.message);
    } on Exception catch (e) {
      warningToast(e.toString());
    }
    _isBusy.value = false;
  }

  void togglePasswordInvisible() {
    _isObscureText.value = !_isObscureText.value;
  }
}
