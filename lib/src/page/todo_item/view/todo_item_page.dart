import 'package:api_test/src/infrastructure/routes/route_names.dart';
import 'package:api_test/src/page/todo_item/controller/todo_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoItemPage extends GetView<TodoItemController> {
  const TodoItemPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar(),
        body: Obx(
          () => _body(),
        ),
  );

  AppBar _appBar() {
    return AppBar(
      title: const Text('Todo Item'),
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurple.shade700,
    );
  }

  Widget _body() {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    } else if (controller.isRetryMode.value) {
      return _retry();
    }
    return _todos();
  }

  Widget _retry() => Center(
        child: ElevatedButton(
          onPressed: controller.getTodo,
          child: const Text('retry'),
        ),
      );

  Widget _todos() => Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              Text('id: ${controller.todo.value.id}'),
              Text('User id: ${controller.todo.value.userId}'),
              Text('title: ${controller.todo.value.title}'),
              Text('is it complete: ${controller.todo.value.isCompleted}'),
            ],
          ),
        ),
      );
}
