import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/model/test_model.dart';
import 'package:task_app/src/resources/api_repository.dart';

class TestCubit extends Cubit<List<ConsignmentChargesRequestParam>> {
  TestCubit() : super([]);

  void loadData() {
    // Load your data and emit it using emit()
    final List<ConsignmentChargesRequestParam> data = [];
    emit(data);
  }

  void loadDataFromJsonString() {
    try {
      final data = json.decode('assets/json/task.json');
      final List<ConsignmentChargesRequestParam> model =
          ConsignmentChargesRequestParam.fromJson(data)
              as List<ConsignmentChargesRequestParam>;
      emit(model);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadJsonData() async {
    try {
      // Load JSON data from a file
      String jsonData = await rootBundle.loadString('assets/json/task.json');
      List<ConsignmentChargesRequestParam> data =
          json.decode(jsonData) as List;

      emit(data);
    } catch (e) {
      print(e);
      emit([]);
    }
  }

  getData() async {
    int x = 0;
    //final List<ConsignmentChargesRequestParam> model = [];
    final modelJson =
        jsonDecode(await rootBundle.loadString('assets/json/task.json'));
    // for (var el in (modelJson as Iterable)) {
    //   x++;
    //   model.add(ConsignmentChargesRequestParam.fromJson(el));
    // }
    print('********Hi********');
    emit(modelJson);
  }
// loadJson() async {
//   String data = await rootBundle.loadString('assets/json/task.json');
//   var jsonResult = json.decode(data);
//   emit(jsonResult);
//   print(jsonResult);
// }
// Future<void> syncDataGet() async {
//   try {
//     //emit(SyncDataGetLoading());
//
//     final responseModel = await syncDataGetUsecase();
//
//     emit(SyncDataGetSucceed(model: responseModel));
//   } catch (ex, strackTrace) {
//     emit(SyncDataGetFailed(ex, strackTrace));
//   }
// }
}
