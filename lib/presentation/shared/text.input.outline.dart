import 'package:flutter/material.dart';

class TextInputOutline extends StatelessWidget {
  TextInputOutline({
    Key? key,
    required this.label,
    required this.controller,
    this.type,
    this.isPassword,
    this.isLong,
    this.inputAction,
  }) : super(key: key);

  final String label;
  TextInputType? type;
  bool? isPassword;
  bool? isLong;
  TextInputAction? inputAction;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: inputAction,
      maxLines: isLong == null || isLong == false ? 1 : 10,
      obscureText: isPassword ?? false,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
