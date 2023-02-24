import 'dart:convert';


import '../model/test_model_2.dart';

class ApiService {
  static Future <TaskModel> fetchData() async {
    try {
      dynamic response = TaskModel;
     //return List<TaskModel>.
      return TaskModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception('Failed to load api');
    }
  }
}
