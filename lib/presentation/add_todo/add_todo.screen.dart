import 'package:clean_arch/presentation/shared/text.input.outline.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_todo.controller.dart';

class AddTodoScreen extends GetView<AddTodoController> {
  const AddTodoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddTodoScreen'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputOutline(label: "title"),
              const SizedBox(height: 8),
              TextInputOutline(label: "description"),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_month),
                  label: const Text("Pick due date")),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Save"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ));
  }
}
