import 'package:clean_arch/domain/repositories/auth_repository.dart';
import 'package:clean_arch/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  Future<void> logout() async {
    await _authRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
