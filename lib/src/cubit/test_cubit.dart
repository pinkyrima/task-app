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
}
