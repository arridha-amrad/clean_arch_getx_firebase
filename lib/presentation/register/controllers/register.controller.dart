import 'package:clean_arch/domain/core/exceptions/auth.exception.dart';
import 'package:clean_arch/domain/models/user_data.dart';
import 'package:clean_arch/domain/repositories/auth_repository.dart';
import 'package:clean_arch/domain/repositories/user_repository.dart';
import 'package:clean_arch/presentation/constants.dart';
import 'package:clean_arch/presentation/shared/my.dialog.dart';
import 'package:clean_arch/presentation/shared/my.snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _authRepository = Get.find<AuthRepository>();
  final UserRepository _userRepository;

  RegisterController({required UserRepository userStore})
      : _userRepository = userStore;

  RxBool isLoading = false.obs;
  RxBool isUsernameValid = false.obs;
  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;

  bool _validateUsername(String val) {
    if (val.isEmpty) return false;
    return true;
  }

  bool _validateEmail(String val) => val.isEmail;
  bool _validatePassword(String val) => passwordRegex.hasMatch(val);

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }

  void _resetTextField() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onInit() {
    usernameController.addListener(() =>
        isUsernameValid.value = _validateUsername(usernameController.text));
    emailController.addListener(
        () => isEmailValid.value = _validateEmail(emailController.text));
    passwordController.addListener(() =>
        isPasswordValid.value = _validatePassword(passwordController.text));
    super.onInit();
  }

  Future<void> register() async {
    isLoading.value = true;
    try {
      final UserCredential userCredential = await _authRepository.register(
        emailController.text,
        passwordController.text,
      );
      final user = userCredential.user;
      if (user == null) throw AuthException("Failed to fetch user");
      final userData = UserData(
        userId: user.uid,
        username: usernameController.text,
        email: emailController.text,
        createdAt: DateTime.now(),
      );
      await _userRepository.save(userData);
      await _authRepository.sendEmailVerification();
      await _authRepository.logout();
      _resetTextField();
      MyDialog.show("Verification required",
          "In order to verify your account, we have sent you an email. Please follow the instructions.");
    } on AuthException catch (e) {
      MySnackbar.set(e.message, SnackBarType.error);
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
