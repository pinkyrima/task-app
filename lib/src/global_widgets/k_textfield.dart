import 'package:flutter/material.dart';

import '../style/k_color.dart';
import '../style/k_textStyle.dart';

class KTextField extends StatefulWidget {
  final String? hintText;

  final TextEditingController? controller;

  const KTextField({
    Key? key,
    this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  _KTextFieldState createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          // border: Border.all(color: KColor.solitude),
          //color: KColor.aliceBlue,
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        // textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              // borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25)),
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintStyle: KTextStyle.bodyText.copyWith(color: KColor.secondary),
        ),
      ),
    );
  }
}
