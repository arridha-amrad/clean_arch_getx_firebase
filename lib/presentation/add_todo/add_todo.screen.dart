import 'package:clean_arch/presentation/shared/text.input.outline.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: controller.dueTimeController,
                    readOnly: true,
                    onTap: () => _pickDate(context),
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      labelText: "Due Date",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextInputOutline(
                    label: "title",
                    controller: controller.titleCon,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: controller.descriptionCon,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        labelText: "Description", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: controller.isTitleValid.isTrue &&
                                controller.isDescriptionValid.isTrue &&
                                controller.isLoading.isFalse
                            ? () => controller.createTodo()
                            : null,
                        child: const Text("Save"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _pickDate(BuildContext context) {
    showDatePicker(
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
      context: context,
      initialDate: DateTime.now(),
    ).then(
      (date) {
        if (date != null) {
          showTimePicker(context: context, initialTime: TimeOfDay.now())
              .then((time) {
            if (time != null) {
              final dateString = DateFormat.yMd().format(date);
              final timeString = time.format(context);
              controller.dueTimeController.text = "$dateString - $timeString";
            }
          });
        }
      },
    );
  }
}
