import 'package:clean_arch/domain/core/exceptions/auth.exception.dart';
import 'package:clean_arch/domain/repositories/auth_repository.dart';
import 'package:clean_arch/infrastructure/navigation/routes.dart';
import 'package:clean_arch/presentation/shared/my.snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _auth = Get.find<AuthRepository>();

  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    emailController
        .addListener(() => isEmailValid.value = emailController.text.isEmail);
    passwordController.addListener(
        () => isPasswordValid.value = passwordController.text.isNotEmpty);
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      final UserCredential userCredential =
          await _auth.login(emailController.text, passwordController.text);
      if (userCredential.user == null) {
        throw AuthException("Failed fetching user");
      }
      final user = userCredential.user!;
      if (!user.emailVerified) {
        throw AuthException("Email is not verified");
      }
      Get.offNamed(Routes.HOME);
    } on AuthException catch (e) {
      MySnackbar.set(e.message, SnackBarType.error);
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
