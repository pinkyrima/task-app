import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/test_cubit.dart';
import '../model/test_model_2.dart';
import '../style/k_color.dart';
import '../style/k_textStyle.dart';

class ChargesScreen extends StatelessWidget {
  const ChargesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<TestCubit, List<TaskModel>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  'Charges',
                  style: KTextStyle.headline5.copyWith(color: KColor.grey),
                ),
                const SizedBox(
                  height: 30,
                ),

                buildCard('Order Id',
                    state[0].consignmentChargesRequestParams![0].oid ?? ''),
                buildCard(
                    'Request Type',
                    state[0]
                            .consignmentChargesRequestParams![0]
                            .requestTypeId ??
                        ''),
                buildCard(
                    'Service Type',
                    state[0]
                            .consignmentChargesRequestParams![0]
                            .serviceTypeId ??
                        ''),
                buildCard(
                    'Category',
                    state[0].consignmentChargesRequestParams![0].categoryId ??
                        'Data Not Found'),
                buildCard(
                    'Packaging',
                    state[0].consignmentChargesRequestParams![0].isPackaging ??
                        ''),
                buildCard(
                    'Packaging Id',
                    state[0].consignmentChargesRequestParams![0].packagingId ??
                        'Data Not Found'),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Thank You',
                      style:
                          KTextStyle.headline6.copyWith(color: KColor.primary),
                    ),
                    Image.asset(
                      'assets/images/smiley.png',
                      height: 50,
                      width: 50,
                    )
                  ],
                )
                // ListTile(title: const Text('Thank You'),trailing: Image.asset('assets/images/smiley.png'))
              ],
            ),
          );
        }
      },
    ));
  }

  Card buildCard(String title, String subTitle) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          subTitle,
          //state[0].consignmentChargesRequestParams![0].oid ?? ''
        ),
      ),
    );
  }
}
