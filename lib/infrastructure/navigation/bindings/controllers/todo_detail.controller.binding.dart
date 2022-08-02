import 'package:get/get.dart';

import '../../../../presentation/todo_detail/controllers/todo_detail.controller.dart';

class TodoDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoDetailController>(
      () => TodoDetailController(),
    );
  }
}
