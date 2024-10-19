import 'package:api_test/src/page/add_todos/controllers/add_todos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoPage extends GetView<AddTodosController> {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar(),
        body: _body(),
      );

  AppBar _appBar() => AppBar(
        title: const Text('Add Todo'),
        backgroundColor: Colors.deepPurple.shade700,
        foregroundColor: Colors.white,
      );

  Widget _body() => Form(
        key: controller.formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _column(),
          ),
        ),
      );

  Column _column() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: controller.titleController,
          validator: controller.validator,
          decoration: InputDecoration(
            hintText: 'Todo',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => controller.isLoading.value
              ? ElevatedButton(
                  onPressed: null,
                  child: Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(),
                  ),
                )
              : ElevatedButton(
                  onPressed: controller.addTodo,
                  child: const Text('Add'),
                ),
        )
      ],
    );
  }
}
