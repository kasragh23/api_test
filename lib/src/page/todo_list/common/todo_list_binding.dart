import 'package:get/get.dart';
import 'package:api_test/src/page/todo_list/controllers/todo_list_controller.dart';

class TodoListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TodoListController>(()=> TodoListController());
  }
}