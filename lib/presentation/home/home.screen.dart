import 'package:clean_arch/infrastructure/navigation/routes.dart';
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
      body: Center(
        child: Text(
          'HomeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
