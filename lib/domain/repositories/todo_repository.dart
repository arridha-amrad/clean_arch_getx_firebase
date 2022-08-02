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

  Future<void> delete(Todo todo) async {
    print("todo id : ${todo.id}");
    await _todoStore.doc(todo.id).delete();
  }

  Future<void> update(Todo todo) async {
    await _todoStore.doc(todo.id).update(todo.toJson());
  }
}
