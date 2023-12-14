import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/validator/form_validators.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
              centerTitle: true,
            ),
            body: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      validator: validateEmail,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Icon(Icons.email),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        validator: validatePassword,
                        obscureText: !controller.isObscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Icon(Icons.lock),
                          ),
                          suffixIcon: IconButton(
                            onPressed: controller.togglePasswordInvisible,
                            icon: Icon(
                              controller.isObscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: controller.login,
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () async =>
                              Get.toNamed<dynamic>(Routes.signUp),
                          child: const Text('Sign Up'),
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
