import 'package:get/get.dart';
import 'package:api_test/src/infrastructure/routes/route_names.dart';
import 'package:flutter/material.dart';
import '../../shared/model/todo_list_view_model.dart';
import '../repository/todo_list_repository.dart';

class TodoListController extends GetxController {
  RxList<TodoListViewModel> todos = RxList();
  RxBool isRetryMode = false.obs, isLoading = true.obs;

  final TodoListRepository _repository = TodoListRepository();

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    isLoading.value = true;
    isRetryMode.value = false;
    await Future.delayed(const Duration(seconds: 3));
    final List<TodoListViewModel>? resultOrException =
        await _repository.getTodos();
    if (resultOrException != null) {
      isLoading.value = false;
      isRetryMode.value = false;
      todos.addAll(resultOrException);
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

  void goToItemInfo(int index) {
    int id = todos[index].id;
    print('it works');
    Get.toNamed(RouteNames.todoItems, parameters: {'id':'$id'});
  }

  void goToAddTodo() async{
    await Get.toNamed(RouteNames.addTodo);
  }
}
