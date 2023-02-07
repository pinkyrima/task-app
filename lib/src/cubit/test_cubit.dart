import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/model/test_model.dart';
import 'package:task_app/src/resources/api_repository.dart';

class TestCubit extends Cubit<TaskModel> {
  TestCubit() : super();

  dynamic get mydata async => emit(await ApiService.fetchData());
}
