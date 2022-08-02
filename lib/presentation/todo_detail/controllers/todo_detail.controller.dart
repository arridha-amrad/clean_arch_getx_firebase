import 'package:clean_arch/domain/models/todo.dart';
import 'package:clean_arch/domain/repositories/todo_repository.dart';
import 'package:clean_arch/presentation/shared/my.snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoDetailController extends GetxController {
  final Todo todo = Get.arguments;
  TextEditingController titleCon = TextEditingController();
  TextEditingController descriptionCon = TextEditingController();
  TextEditingController dueTime = TextEditingController();

  final TodoRepository _todoRepository;

  TodoDetailController({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  RxBool isTitleValid = false.obs;
  RxBool isDescriptionValid = false.obs;
  RxBool isDone = false.obs;

  @override
  void onInit() {
    super.onInit();
    titleCon.addListener(() => isTitleValid.value = titleCon.text.isNotEmpty);
    descriptionCon
        .addListener(() => isTitleValid.value = descriptionCon.text.isNotEmpty);
  }

  @override
  void onReady() {
    super.onReady();
    titleCon.text = todo.title;
    descriptionCon.text = todo.description;
    isDone.value = todo.isDone;
    dueTime.text = todo.dueTime;
  }

  @override
  void onClose() {
    super.onClose();
    titleCon.dispose();
    descriptionCon.dispose();
  }

  Future<void> deleteTodo() async {
    try {
      await _todoRepository.delete(todo);
      MySnackbar.set("Todo deleted sucessfully", SnackBarType.ok);
    } catch (e) {
      MySnackbar.set("Todo deleted failure", SnackBarType.error);
      rethrow;
    }
  }

  Future<void> updateTodo() async {
    final updatedTodo = Todo(
      createdAt: todo.createdAt,
      description: descriptionCon.text,
      dueTime: todo.dueTime,
      isDone: isDone.value,
      title: titleCon.text,
      updatedAt: DateTime.now(),
      userId: todo.userId,
      id: todo.id,
    );
    try {
      await _todoRepository.update(updatedTodo);
      MySnackbar.set("Todo updated successfully", SnackBarType.ok);
    } catch (e) {
      MySnackbar.set("Todo deleted failure", SnackBarType.error);
      rethrow;
    }
  }
}
