import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../infrastructure/commons/repository_urls.dart';
import '../models/todo_dto.dart';

class AddTodosRepository {
  late final http.Response response;
  Future<Either<String, Map<String, dynamic>>> addTodo(
      {required TodoDto dto}) async {
    try {
      final body = json.encode(dto.toJason());
      response = await http.post(
        RepositoryUrls.getTodos,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      return Right(jsonDecode(response.body));

    } catch (e) {
      return Left('$e');
    }
  }
}
