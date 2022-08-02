import 'package:clean_arch/domain/repositories/auth_repository.dart';
import 'package:clean_arch/domain/repositories/todo_repository.dart';
import 'package:clean_arch/infrastructure/navigation/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();
  final TodoRepository _todoRepo;

  HomeController({required TodoRepository todoRepository})
      : _todoRepo = todoRepository;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamTodos() async* {
    yield* _todoRepo.streamTodo();
  }

  Future<void> logout() async {
    await _authRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
