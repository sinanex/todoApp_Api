import 'dart:developer';
import 'package:api/services/service.dart';
import 'package:api/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ProviderApi extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  List<TodoModel> todoData = [];
  TodoService todo = TodoService();
  void addData() async {
    todo.addTodo(
      TodoModel(title: titleController.text, subtitle: subtitleController.text),
    );
    getTodo();
    notifyListeners();
    titleController.clear();
    subtitleController.clear();
    notifyListeners();
  }

  Future<void> getTodo() async {
    try {
      todoData = await todo.getTodo();
    } catch (e) {
      log("error $e");
    } finally {
      notifyListeners();
    }
    notifyListeners();
  }

  void delete(String id) async {
    todo.deleteTodo(id);
    getTodo();
    notifyListeners();
  }

  void update({required String id,required String title,required String subtile}) async {
    todo.updateData(
     TodoModel(title: title, subtitle: subtile),
        id);

    notifyListeners();
        getTodo();
  }
}
class displayData extends ChangeNotifier {
Dio dio = Dio();

static const url = 'https://67566fa211ce847c992cc715.mockapi.io/todo/data';

  String? titile;
  String? subtitle;

  Future<TodoModel?> viewData({String? id}) async {
    try {
      final response = await dio.get('$url/$id');
      if (response.statusCode == 200) {
        return TodoModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void display(String? id) {
    viewData(id: id).then((todo) {
      if (todo != null) {
        titile = todo.title;
        subtitle = todo.subtitle;
        notifyListeners();
      }
    });
    notifyListeners();
  }
}