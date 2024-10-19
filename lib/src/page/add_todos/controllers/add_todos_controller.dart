import 'package:api_test/src/page/add_todos/repositories/add_todos_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/todo_dto.dart';

class AddTodosController extends GetxController {
  final AddTodosRepository _repository = AddTodosRepository();
  final TextEditingController titleController = TextEditingController();
  RxBool isLoading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey();

  String? validator(String? value) {
    if (value != null) {
      if (value.isEmpty) return 'required';
    }
    return null;
  }

  Future<void> addTodo() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    isLoading.value = true;
    final TodoDto addTodoDto =
        TodoDto(title: titleController.text, userId: 1, isCompleted: false);

    final isAddSuccessful = await _repository.addTodo(dto: addTodoDto);
    isLoading.value = false;
    isAddSuccessful.fold(
      (exception) {
        //TODO: error handling
        Get.showSnackbar(
          GetSnackBar(
            title: 'Failed to add',
            message: 'Something went wrong',
            backgroundColor: Colors.red.shade700,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      (todo) {
        //TODO: add todo
        Get.back(result: addTodoDto.toJason());
        print('it added successfully');
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Done',
            message: 'Todo has added successfully',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
          ),
        );
        titleController.text = '';
      },
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
}
