import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../style/k_color.dart';
import '../style/k_textStyle.dart';

class KButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback ? onPressed;

  const KButton({
    Key? key,
    @required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 62,
        width: context.screenWidth,
        decoration: BoxDecoration(
          color: KColor.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        // ignore: deprecated_member_use
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: KColor.primary,
          ),
          onPressed: onPressed,
          child: Text(
            buttonText!,
            style: KTextStyle.bodyText.copyWith(color: KColor.white),
          ),
        ));
  }
}
