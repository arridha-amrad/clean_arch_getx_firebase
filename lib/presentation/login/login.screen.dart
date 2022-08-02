import 'package:clean_arch/infrastructure/navigation/routes.dart';
import 'package:clean_arch/presentation/shared/off_screen_loading.dart';
import 'package:clean_arch/presentation/shared/text.input.outline.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginScreen'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Obx(() => controller.isLoading.isTrue
                ? const OffScreenLoading()
                : const SizedBox.shrink()),
            _formLogin(),
          ],
        ));
  }

  _formLogin() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              TextInputOutline(
                  type: TextInputType.emailAddress,
                  label: "Email",
                  controller: controller.emailController),
              const SizedBox(height: 8),
              TextInputOutline(
                  isPassword: true,
                  label: "Password",
                  controller: controller.passwordController),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: Obx(() => ElevatedButton(
                    onPressed: controller.isEmailValid.isTrue &&
                            controller.isPasswordValid.isTrue &&
                            controller.isLoading.isFalse
                        ? () {
                            controller.login();
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        : null,
                    child: const Text("Login"))),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ? "),
                  TextButton(
                      onPressed: () => Get.offNamed(Routes.REGISTER),
                      child: const Text("register"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
