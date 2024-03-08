import 'package:flutter/material.dart';

void displaySnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.deepPurple,
      duration: Duration(seconds: 2),
      content: Text(
        content,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
