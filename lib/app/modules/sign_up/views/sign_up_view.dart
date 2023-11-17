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
                    obscureText: !controller.isObscureText,
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
