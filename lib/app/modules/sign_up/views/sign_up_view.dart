import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                  validator: controller.validateEmail,
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
                    validator: controller.validatePassword,
                    obscureText: controller.passwordInvisible.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Icon(Icons.lock),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: controller.togglePasswordInvisible,
                        child: Icon(
                          controller.passwordInvisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordConfirmController,
                    validator: controller.validatePasswordConfirm,
                    obscureText: controller.passwordInvisible.value,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      icon: const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Icon(Icons.lock),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: controller.togglePasswordInvisible,
                        child: Icon(
                          controller.passwordInvisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.signUp,
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      );
}
