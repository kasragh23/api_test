import 'package:api_test/src/page/add_todos/commons/add_todos_binding.dart';
import 'package:api_test/src/page/add_todos/view/add_todo_page.dart';
import 'package:api_test/src/page/todo_item/common/todo_item_binding.dart';
import 'package:api_test/src/page/todo_item/view/todo_item_page.dart';
import 'package:get/get.dart';
import 'package:api_test/src/infrastructure/routes/route_path.dart';
import 'package:api_test/src/page/todo_list/common/todo_list_binding.dart';
import 'package:api_test/src/page/todo_list/view/todo_list_page.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
        name: RoutePath.todos,
        page: () => const TodoListPage(),
        binding: TodoListBinding(),
        children: [
          GetPage(
            name: RoutePath.todoItems,
            page: () => const TodoItemPage(),
            binding: TodoItemBinding(),
          ),
          GetPage(
            name: RoutePath.addTodo,
            page: () => const AddTodoPage(),
            binding: AddTodosBinding(),
          )
        ]),
  ];
}
