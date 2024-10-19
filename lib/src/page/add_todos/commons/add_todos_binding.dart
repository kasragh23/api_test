import 'package:api_test/src/page/add_todos/controllers/add_todos_controller.dart';
import 'package:get/get.dart';

class AddTodosBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AddTodosController());
  }
}