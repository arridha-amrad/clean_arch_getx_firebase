import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackBarType {
  ok,
  error,
}

class MySnackbar {
  static set(String message, SnackBarType type) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
      content: Text(message),
      backgroundColor: type == SnackBarType.ok ? Colors.green : Colors.red,
    ));
  }
}
