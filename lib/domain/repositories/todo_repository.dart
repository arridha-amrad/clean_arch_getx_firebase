import 'package:clean_arch/domain/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoRepository {
  final _todoStore = FirebaseFirestore.instance.collection("todos");

  Future<void> save(Todo todo) async {
    await _todoStore.doc(todo.id).set(todo.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamTodo() async* {
    yield* _todoStore.orderBy("createdAt", descending: true).snapshots();
  }
}
