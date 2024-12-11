import 'dart:developer';
import 'package:api/model/model.dart';
import 'package:dio/dio.dart';

class TodoService {
  Dio dio = Dio();

  static const baseUrl =
      'https://67566fa211ce847c992cc715.mockapi.io/todo/data';

  Future<List<TodoModel>> getTodo() async {
    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((e) => TodoModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Error: Failed to fetch data");
      }
    } catch (e) {
      log("Error in getTodo: $e");
      throw Exception("Failed to get data: $e");
    }
  }

  void addTodo(TodoModel todo) async {
    final data = todo.toJson();
    try {
      Response response = await dio.post(baseUrl, data: data);
      if (response.statusCode == 201) {
        log("Todo added successfully");
      } else {
        log("Failed to add Todo");
      }
    } catch (e) {
      log("Error in addTodo: $e");
    }
  }

  void updateData(TodoModel todo, String id) async {
    final data = todo.toJson();
    try {
      await dio.put("$baseUrl/$id", data: data);
      log("Todo updated successfully");
    } catch (e) {
      log("Error in updateData: $e");
    }
  }

  void deleteTodo(String id) async {
    try {
      await dio.delete("$baseUrl/$id");
      log("Todo deleted successfully");
    } catch (e) {
      log("Error in deleteTodo: $e");
    }
  }
}
