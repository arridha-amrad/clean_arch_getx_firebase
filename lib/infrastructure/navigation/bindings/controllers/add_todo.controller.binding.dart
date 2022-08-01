import 'package:get/get.dart';

import '../../../../presentation/add_todo/controllers/add_todo.controller.dart';

class AddTodoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(
      () => AddTodoController(),
    );
  }
}
