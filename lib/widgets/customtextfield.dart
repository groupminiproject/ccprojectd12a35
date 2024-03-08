import 'package:flutter/material.dart';

class CustomTextInputField extends StatelessWidget {
  final TextEditingController controller;
  final keyboardtype;
  final String hintText;
  int maxLines;
  TextInputAction textInputAction;
  CustomTextInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardtype,
      this.maxLines = 1,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your ${hintText}';
          }
          return null;
        },
        textInputAction: textInputAction,
        keyboardType: keyboardtype,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black45),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: hintText,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
        ),
      ),
    );
  }
}
