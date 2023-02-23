import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/test_cubit.dart';
import '../model/test_model.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TestCubit, List<ConsignmentChargesRequestParam>>(
        builder: (context, data) {
          // Use the data to build your UI
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                title: Text(
                  item.heightValue,
                  style: TextStyle(color: Colors.pink,fontSize: 30),
                ),
                subtitle: Text(item.isDhakaCity,style: TextStyle(color: Colors.pink,fontSize: 20),),
              );
            },
          );
        },
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
