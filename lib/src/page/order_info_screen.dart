import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/cubit/test_cubit.dart';
import 'package:task_app/src/global_widgets/k_button.dart';
import 'package:task_app/src/model/test_model_2.dart';
import 'package:task_app/src/page/charges_screen.dart';
import 'package:task_app/src/style/k_color.dart';
import 'package:velocity_x/velocity_x.dart';

import '../global_widgets/k_textfield.dart';
import '../style/k_textStyle.dart';

class OrderInfoScreen extends StatefulWidget {
  const OrderInfoScreen({Key? key}) : super(key: key);

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  bool _isRadioSelected = false;
  bool _isRequestType = false;
  bool _isHomeDelivery = false;
  bool _isPayer = false;
  bool _isPayment = false;

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
                    'Order Request',
                    style: KTextStyle.headline5.copyWith(color: KColor.grey),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Order Id',
                    style: KTextStyle.subTitle1.copyWith(color: KColor.grey),
                  ),
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: KTextField(
                      hintText: state[0].orderCnRequest?.cnRequestId,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// Service type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Service Type'),
                      LabeledRadio(
                        // label: 'This is the first label text',
                        label: state[0].orderCnRequest?.serviceTypeId ?? '',
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
                        label: 'Emergency',
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

                  /// Request type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Request Type'),
                      LabeledRadio(
                        // label: 'This is the first label text',
                        label: state[0].orderCnRequest?.requestTypeId ?? '',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: true,
                        groupValue: _isRequestType,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isRequestType = newValue;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'Home Delivery',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: false,
                        groupValue: _isRequestType,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isRequestType = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// Home Delivery type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Home Delivery'),
                      LabeledRadio(
                        // label: 'This is the first label text',
                        label: state[0].orderCnRequest?.homeDelivery ?? '',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: true,
                        groupValue: _isHomeDelivery,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isHomeDelivery = newValue;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'yes',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: false,
                        groupValue: _isHomeDelivery,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isHomeDelivery = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// Payer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Payer'),
                      LabeledRadio(
                        // label: 'This is the first label text',
                        label: state[0].orderCnRequest?.payer ?? '',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: true,
                        groupValue: _isPayer,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isPayer = newValue;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'Others',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: false,
                        groupValue: _isPayer,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isPayer = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// Payment Type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Payment Type'),
                      LabeledRadio(
                        // label: 'This is the first label text',
                        label: state[0].orderCnRequest?.paymentType ?? '',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: true,
                        groupValue: _isPayment,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isPayment = newValue;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'Online',
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: false,
                        groupValue: _isPayment,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isPayment = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  KButton(
                    buttonText: 'Charges',
                    onPressed: () {
                      context.nextPage(ChargesScreen());
                    },
                  ),

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
