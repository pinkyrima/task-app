import 'dart:convert';

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

  getData() async {
    int x = 0;
    final List<ConsignmentChargesRequestParam> model = [];
    final modelJson =
        jsonDecode(await rootBundle.loadString('assets/json/task.json'));
    for (var el in (modelJson as Iterable)) {
      x++;
      model.add(ConsignmentChargesRequestParam.fromJson(el));
    }
    print('********Hi********');
    emit(model);
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
