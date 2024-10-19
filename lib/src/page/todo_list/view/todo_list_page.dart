import '../controllers/todo_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoListPage extends GetView<TodoListController> {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar(),
          body: Obx(
        () => _body(),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: controller.goToAddTodo,
      child: const Icon(Icons.add),
    ),

  );

  AppBar _appBar(){
    return
    AppBar(
      title: const Text('Todo List Page'),
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
          onPressed: controller.getTodos,
          child: const Text('retry'),
        ),
      );

  Widget _todos() => ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          final todo = controller.todos[index];
          return ListTile(
            title: Text(todo.title),
            onTap: ()=> controller.goToItemInfo(index),
            hoverColor: Colors.green.shade100,
          );
        } /*=> Text(controller.todos[index].title)*/,
      );
}
