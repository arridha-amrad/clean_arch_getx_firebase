import 'package:clean_arch/domain/repositories/todo_repository.dart';
import 'package:get/get.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(todoRepository: Get.find<TodoRepository>()),
    );
  }
}
