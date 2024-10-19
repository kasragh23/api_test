import 'package:api_test/src/page/todo_item/controller/todo_item_controller.dart';
import 'package:get/get.dart';

class TodoItemBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> TodoItemController());
  }

}