import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/test_model_2.dart';

class TestCubit extends Cubit<List<TaskModel>> {
  TestCubit() : super([]);

  // void loadData() {
  //   // Load your data and emit it using emit()
  //   final List<ConsignmentChargesRequestParams> data = [];
  //   emit(data);
  // }

  Future<void> loadJsonData() async {
    try {
      var jsonData = await rootBundle.loadString('assets/json/task.json');
      final decodedJson = json.decode(jsonData);
      final data = TaskModel.fromJson(decodedJson);

      final list = data.consignmentChargesRequestParams;
      if (list != null) {
        emit(list);
      }
    } catch (e) {
      print(e);
      emit([]);
    }
  }
}
