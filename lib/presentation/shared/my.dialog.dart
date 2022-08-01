import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  static show(String title, String description) {
    showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(description),
              actions: [
                TextButton(onPressed: () => Get.back(), child: const Text("Ok"))
              ],
            ));
  }
}
