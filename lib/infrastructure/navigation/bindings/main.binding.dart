import 'package:clean_arch/domain/repositories/auth_repository.dart';
import 'package:clean_arch/domain/repositories/user_repository.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepository());
    Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
  }
}
