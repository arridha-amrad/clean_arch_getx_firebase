import 'package:clean_arch/domain/repositories/todo_repository.dart';
import 'package:get/get.dart';

import '../../../../presentation/todo_detail/controllers/todo_detail.controller.dart';

class TodoDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoDetailController>(
      () => TodoDetailController(todoRepository: Get.find<TodoRepository>()),
    );
  }
}
