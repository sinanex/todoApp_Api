import 'package:api/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

Dio dio = Dio();

const url = 'https://67566fa211ce847c992cc715.mockapi.io/todo/data';
Future<List<TodoModel>> getData() async {
  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<TodoModel> todoList =
          data.map((item) => TodoModel.fromJson(item)).toList();
      return todoList;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

void postData(TodoModel Tododata) async {
  final datas = Tododata.toJson();
  final response = await dio.post(url, data: datas);
  if (response.statusCode == 201) {
    print(response.data);
  } else {
  }
  getData();
}

void deleteData(String id) async {
  try {
    await dio.delete('$url/$id');
  } catch (e) {
  }
  getData();
}

void editData({required String id, required TodoModel todoData}) async {
  final datas = todoData.toJson();
  try {
    await dio.put<TodoModel>('$url/$id', data: datas);
  } catch (e) {
    print('$e');
  }
  getData();
}

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

class displayData extends ChangeNotifier {
  String? titile;
  String? subtitle;
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
