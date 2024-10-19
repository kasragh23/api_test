import 'dart:convert';

import 'package:api_test/src/infrastructure/commons/repository_urls.dart';
import 'package:http/http.dart' as http;

import '../../shared/model/todo_list_view_model.dart';


class TodoItemRepository {
  Future<TodoListViewModel?> getTodo(int id) async {
    final Uri url = RepositoryUrls.getTodoById(id: id);
    print(url);
    final http.Response response = await http.get(url);
    try {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      return TodoListViewModel.fromJson(jsonData);
    } catch (e) {
      print('something went wrong -> statusCode: ${response.statusCode}');
    }
    return null;
  }
}
