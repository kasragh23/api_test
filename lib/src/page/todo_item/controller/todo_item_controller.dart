import 'package:api_test/src/page/todo_item/repository/todo_item_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/model/todo_list_view_model.dart';

class TodoItemController extends GetxController {
  Rx<TodoListViewModel> todo = TodoListViewModel(
    userId: 0,
    id: 0,
    title: 'title',
    isCompleted: false,
  ).obs;

  RxBool isRetryMode = false.obs, isLoading = true.obs;
  String idString = Get.parameters['id']?? '';
  int id = 0;

  final TodoItemRepository _repository = TodoItemRepository();

  @override
  void onInit() {
    super.onInit();
    getTodo();
    id = int.parse(idString);
  }

  Future<void> getTodo() async {
    isLoading.value = true;
    isRetryMode.value = false;
    await Future.delayed(const Duration(seconds: 2));
    final TodoListViewModel? resultOrException =
        await _repository.getTodo(id);
    if (resultOrException != null) {
      isLoading.value = false;
      isRetryMode.value = false;
      todo.value = resultOrException;
    } else {
      Get.showSnackbar(
        GetSnackBar(
          message: 'OHW!',
          backgroundColor: Colors.red.shade900,
          duration: const Duration(seconds: 3),
        ),
      );
      isLoading.value = false;
      isRetryMode.value = true;
    }
  }
}
