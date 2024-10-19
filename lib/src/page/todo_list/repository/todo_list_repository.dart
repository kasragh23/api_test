import 'dart:convert';

import 'package:api_test/src/infrastructure/commons/repository_urls.dart';
import 'package:http/http.dart' as http;

import '../../shared/model/todo_list_view_model.dart';


class TodoListRepository {
  Future<List<TodoListViewModel>?> getTodos() async {
    final Uri url = RepositoryUrls.getTodos;
    final http.Response response = await http.get(url);
    try {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<TodoListViewModel> todos = jsonData
          .map(
            (todo) => TodoListViewModel.fromJson(todo as Map<String, dynamic>),
          )
          .toList();
      return todos;
    } catch (e) {
      print('something went wrong -> statusCode: ${response.statusCode}');
    }
    return null;
  }
}
