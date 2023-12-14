import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../data/validator/form_validators.dart';
import '../../../routes/app_pages.dart';
import '../../../ui/inputs/email_input.dart';
import '../../../ui/inputs/password_input.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(S.current.login),
              centerTitle: true,
            ),
            body: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    EmailInput(
                      validator: validateEmail,
                      controller: controller.emailController,
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
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: controller.login,
                      child: Text(S.current.login),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          S.current.doNotHaveAnAccount,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () async =>
                              Get.toNamed<dynamic>(Routes.signUp),
                          child: Text(S.current.signUp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<LoginController>(
            builder: (controller) {
              if (controller.isBusy) {
                return AbsorbPointer(
                  child: Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 1,
                        sigmaY: 1,
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          // GetBuilder<LoginController>(
          //   builder: (controller) {
          //     debugPrint('LoginView isBusy: ${controller.isBusy}');
          //     if (controller.isBusy) {
          //       return const Center(
          //         child: SizedBox(
          //           width: 24,
          //           height: 24,
          //           child: CircularProgressIndicator(),
          //         ),
          //       );
          //     }
          //     return const SizedBox.shrink();
          //   },
          // ),
        ],
      );
}
