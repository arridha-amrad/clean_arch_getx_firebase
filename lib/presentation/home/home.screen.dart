import 'package:clean_arch/domain/models/todo.dart';
import 'package:clean_arch/infrastructure/navigation/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => controller.logout(),
                icon: const Icon(Icons.logout))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () => Get.toNamed(Routes.ADD_TODO),
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamTodos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final docs = snapshot.data!.docs;
            if (docs.isEmpty) {
              return const Center(
                child: Text("You have no todos"),
              );
            }
            final todos =
                docs.map((json) => Todo.fromJson(json.data())).toList();

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final isEdited = todos[index].createdAt.toString() !=
                    todos[index].updatedAt.toString();
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.TODO_DETAIL,
                        arguments: todos[index]),
                    contentPadding: const EdgeInsets.all(12),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          todos[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        isEdited
                            ? const Text(
                                " edited",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          width: 12.0,
                        ),
                        todos[index].isDone
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Due : ${todos[index].dueTime}"),
                            const SizedBox(height: 4),
                            Text(todos[index].description),
                          ],
                        )),
                  ),
                );
              },
            );
          },
        ));
  }
}
