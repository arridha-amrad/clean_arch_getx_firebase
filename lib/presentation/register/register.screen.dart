import 'package:clean_arch/infrastructure/navigation/routes.dart';
import 'package:clean_arch/presentation/shared/off_screen_loading.dart';
import 'package:clean_arch/presentation/shared/text.input.outline.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterScreen'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(() => controller.isLoading.isTrue
              ? const OffScreenLoading()
              : const SizedBox.shrink()),
          _formRegister(),
        ],
      ),
    );
  }

  _formRegister() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              TextInputOutline(
                controller: controller.usernameController,
                label: "Username",
              ),
              const SizedBox(height: 8),
              TextInputOutline(
                controller: controller.emailController,
                type: TextInputType.emailAddress,
                label: "Email",
              ),
              const SizedBox(height: 8),
              TextInputOutline(
                controller: controller.passwordController,
                isPassword: true,
                label: "Password",
              ),
              const SizedBox(height: 8),
              SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: controller.isEmailValid.isTrue &&
                              controller.isUsernameValid.isTrue &&
                              controller.isPasswordValid.isTrue
                          ? () {
                              controller.register();
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                          : null,
                      child: const Text("Register"),
                    ),
                  )),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ? "),
                  TextButton(
                      onPressed: () => Get.offNamed(Routes.LOGIN),
                      child: const Text("login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
