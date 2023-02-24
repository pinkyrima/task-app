import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/test_model_2.dart';

class TestCubit extends Cubit<List<ConsignmentChargesRequestParams>> {
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

      /// cubit ekhane chacce List<ConsignmentChargesRequestParam> ey type ta
      /// tai amra datar modde nested ei type ta dibo, tobei amdader ui update hobe
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
