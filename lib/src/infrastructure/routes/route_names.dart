import 'route_path.dart';

class RouteNames {
  static const String todos = RoutePath.todos;
  static const String todoItems = '${RoutePath.todos}${RoutePath.todoItems}';
  static const String addTodo = '${RoutePath.todos}${RoutePath.addTodo}';
}