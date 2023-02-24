import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/test_cubit.dart';
import '../model/test_model.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
        centerTitle: true,
      ),
      body: BlocBuilder<TestCubit, List<ConsignmentChargesRequestParam>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state[index].heightValue),
                    subtitle: Text(state[index].isVolumetricWeight),
                  );
                });
          }
        },
      ),
    );

    //   BlocBuilder<TestCubit, List<TaskModel>>(
    //   builder: (context, data) {
    //     // Use the data to build your UI
    //     return ListView.builder(
    //       itemCount: data.length,
    //       itemBuilder: (context, index) {
    //         final item = data[index];
    //         return ListTile(
    //           title: Text(item.parentConsignmentChargeOid),
    //           subtitle: Text(item.parentConsignmentChargesRequestOid),
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
