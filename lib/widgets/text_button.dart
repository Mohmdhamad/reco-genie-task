import 'package:flutter/material.dart';

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
}) => TextButton(
  onPressed: function,
  child: Text(
    isUpperCase ? text.toUpperCase() : text,
    style: TextStyle(fontSize: 17.0,color: Colors.blue),
  ),
);
