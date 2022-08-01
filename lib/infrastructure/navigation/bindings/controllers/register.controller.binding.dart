import 'package:clean_arch/domain/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../../../../presentation/register/controllers/register.controller.dart';

class RegisterControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(userStore: Get.find<UserRepository>()),
    );
  }
}
