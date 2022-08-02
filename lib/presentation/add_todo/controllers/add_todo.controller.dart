import 'package:clean_arch/domain/models/todo.dart';
import 'package:clean_arch/domain/repositories/auth_repository.dart';
import 'package:clean_arch/domain/repositories/todo_repository.dart';
import 'package:clean_arch/infrastructure/navigation/routes.dart';
import 'package:clean_arch/presentation/shared/my.snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddTodoController extends GetxController {
  TextEditingController titleCon = TextEditingController();
  TextEditingController descriptionCon = TextEditingController();
  TextEditingController dueTimeController = TextEditingController();

  final TodoRepository _todoRepository;
  final _authRepo = Get.find<AuthRepository>();

  RxBool isLoading = false.obs;
  RxBool isTitleValid = false.obs;
  RxBool isDescriptionValid = false.obs;

  AddTodoController({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  void onInit() {
    super.onInit();
    titleCon.addListener(() => isTitleValid.value = titleCon.text.isNotEmpty);
    descriptionCon.addListener(
        () => isDescriptionValid.value = descriptionCon.text.isNotEmpty);
  }

  @override
  void onClose() {
    super.onClose();
    titleCon.dispose();
    descriptionCon.dispose();
  }

  void resetTextField() {
    titleCon.clear();
    descriptionCon.clear();
    dueTimeController.clear();
  }

  Future<void> createTodo() async {
    isLoading.value = true;
    if (_authRepo.user == null) {
      Get.offAllNamed(Routes.HOME);
      return;
    }
    try {
      final todo = Todo(
        id: const Uuid().v4(),
        title: titleCon.text,
        description: descriptionCon.text,
        dueTime: dueTimeController.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isDone: false,
        userId: _authRepo.user!.uid,
      );
      await _todoRepository.save(todo);
      resetTextField();
      MySnackbar.set("New todo created successfully", SnackBarType.ok);
    } catch (e) {
      MySnackbar.set("Failed to create todo", SnackBarType.error);
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
