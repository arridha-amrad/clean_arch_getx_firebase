import 'package:clean_arch/domain/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoRepository {
  final _todoStore = FirebaseFirestore.instance.collection("todos");

  Future<DocumentReference<Map<String, dynamic>>> save(Todo todo) async {
    final newTodo = await _todoStore.add(todo.toJson());
    return newTodo;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamTodo() async* {
    yield* _todoStore.snapshots();
  }
}
