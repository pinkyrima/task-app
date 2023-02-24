import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/cubit/test_cubit.dart';
import 'package:task_app/src/model/test_model_2.dart';

class SenderInfoScreen extends StatelessWidget {
  const SenderInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),
      body: BlocBuilder<TestCubit, List<TaskModel>>(
        builder: (context, state) {
          print(state.length);
          if (state.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        state[index].orderCnRequest?.homeDelivery ?? '',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      subtitle:
                          Text(state[index].senderInfo?.senderAddress ?? ''),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
