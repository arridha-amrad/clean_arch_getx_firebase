import 'package:clean_arch/presentation/shared/text.input.outline.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/todo_detail.controller.dart';

class TodoDetailScreen extends GetView<TodoDetailController> {
  const TodoDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TodoDetailScreen'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => _showDeleteDialog(context),
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Is Complete",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Obx(
                        () => Switch(
                            value: controller.isDone.value,
                            onChanged: (value) =>
                                controller.isDone.value = value),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: controller.dueTime,
                    style: const TextStyle(color: Colors.black54),
                    readOnly: true,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      labelText: "Due Date",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextInputOutline(
                      label: "Title", controller: controller.titleCon),
                  const SizedBox(height: 12),
                  TextInputOutline(
                    inputAction: TextInputAction.newline,
                    isLong: true,
                    type: TextInputType.multiline,
                    label: "Description",
                    controller: controller.descriptionCon,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.updateTodo(),
                      child: const Text("Update"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () => Get.back(), child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      controller.deleteTodo();
                      Get.back();
                      Get.back();
                    },
                    child: const Text("Ok")),
              ],
              title: const Text(
                "Delete Todo",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: const Text("Are you sure to delete this todo ?"),
            ));
  }
}
