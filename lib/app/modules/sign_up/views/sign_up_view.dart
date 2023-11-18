import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/validator/form_validators.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
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
                    obscureText: controller.isObscureText,
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
                const SizedBox(height: 8),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordConfirmController,
                    validator: (confirmPassword) => validatePasswordConfirm(
                      controller.passwordController.text,
                      confirmPassword,
                    ),
                    obscureText: controller.isObscureText,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
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
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.isBusy ? null : controller.signUp,
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor:
                          Theme.of(context).primaryColor.withOpacity(.8),
                      disabledForegroundColor: Colors.white70,
                    ),
                    child: controller.isBusy
                        ? Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(2),
                            child: const CircularProgressIndicator(
                              color: Colors.white70,
                              strokeWidth: 3,
                            ),
                          )
                        : const Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
