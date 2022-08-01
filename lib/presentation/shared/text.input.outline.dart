import 'package:flutter/material.dart';

class TextInputOutline extends StatelessWidget {
  TextInputOutline({
    Key? key,
    required this.label,
    this.controller,
    this.type,
    this.isPassword,
    this.onChanged,
  }) : super(key: key);

  final String label;
  TextInputType? type;
  bool? isPassword;
  void Function(String)? onChanged;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: isPassword ?? false,
      keyboardType: type ?? TextInputType.name,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
