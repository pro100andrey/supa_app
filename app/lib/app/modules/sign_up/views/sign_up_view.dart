import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../data/validator/form_validators.dart';
import '../../../ui/inputs/email_input.dart';
import '../../../ui/inputs/password_input.dart';
import '../../../ui/overlays/progress_overlay.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(S.current.signUp),
              centerTitle: true,
            ),
            body: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    EmailInput(
                      controller: controller.emailController,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => PasswordInput(
                        controller: controller.passwordController,
                        validator: validatePassword,
                        isObscureText: controller.isObscureText,
                        onPressed: controller.togglePasswordInvisible,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => PasswordInput(
                        labelText: S.current.confirmPassword,
                        isObscureText: controller.isObscureText,
                        controller: controller.passwordConfirmController,
                        validator: (confirmPassword) => validatePasswordConfirm(
                          controller.passwordController.text,
                          confirmPassword,
                        ),
                        onPressed: controller.togglePasswordInvisible,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: controller.signUp,
                      child: Text(S.current.signUp),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => ProgressOverlay(show: controller.isBusy),
          ),
        ],
      );
}
