import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/todo_detail.controller.dart';

class TodoDetailScreen extends GetView<TodoDetailController> {
  const TodoDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoDetailScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TodoDetailScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
