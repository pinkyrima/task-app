import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/cubit/test_cubit.dart';
import 'package:task_app/src/global_widgets/k_button.dart';
import 'package:task_app/src/model/test_model_2.dart';
import 'package:task_app/src/page/order_info_screen.dart';
import 'package:task_app/src/style/k_color.dart';
import 'package:velocity_x/velocity_x.dart';

import '../global_widgets/k_textfield.dart';
import '../style/k_textStyle.dart';

class SenderInfoScreen extends StatefulWidget {
  const SenderInfoScreen({Key? key}) : super(key: key);

  @override
  State<SenderInfoScreen> createState() => _SenderInfoScreenState();
}

class _SenderInfoScreenState extends State<SenderInfoScreen> {
  bool _isRadioSelected = false;

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
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sender Info',
                    style: KTextStyle.headline5.copyWith(color: KColor.grey),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Name In English',
                    style: KTextStyle.subTitle1.copyWith(color: KColor.grey),
                  ),
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: KTextField(
                      hintText: state[0].senderInfo?.senderNameEn,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Name In Bangla',
                    style: KTextStyle.subTitle1.copyWith(color: KColor.grey),
                  ),
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: KTextField(
                      hintText: state[0].senderInfo?.senderNameBn??'Data Not Found',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// Sender type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sender Type'),
                      LabeledRadio(
                        // label: 'This is the first label text',
                        label: state[0].senderInfo?.senderType ?? '',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: true,
                        groupValue: _isRadioSelected,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isRadioSelected = newValue;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'Others',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: false,
                        groupValue: _isRadioSelected,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isRadioSelected = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Phone',
                    style: KTextStyle.subTitle1.copyWith(color: KColor.grey),
                  ),
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: KTextField(
                      hintText: state[0].senderInfo?.senderPhone,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email',
                    style: KTextStyle.subTitle1.copyWith(color: KColor.grey),
                  ),
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: KTextField(
                      hintText: state[0].senderInfo?.senderEmail,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Address',
                    style: KTextStyle.subTitle1.copyWith(color: KColor.grey),
                  ),
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: KTextField(
                      hintText: state[0].senderInfo?.senderAddress,
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  KButton(
                      buttonText: 'Go to Order Info',
                      onPressed: () {
                        context.nextPage(const OrderInfoScreen());
                      }),

                  const SizedBox(
                    height: kBottomNavigationBarHeight + 30,
                  ),
                ],
              ),
            );
            // ListView.builder(
            //   itemCount: state.length,
            //   itemBuilder: (context, index) {
            //     return Card(
            //       child: ListTile(
            //         title: Text(
            //           state[index].orderCnRequest?.homeDelivery ?? '',
            //           style: TextStyle(color: Colors.red, fontSize: 20),
            //         ),
            //         subtitle:
            //             Text(state[index].senderInfo?.senderAddress ?? ''),
            //       ),
            //     );
            //   });
          }
        },
      ),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
