import 'package:flutter/material.dart';

Widget defaultFloatingButton({
  double width = double.infinity,
  double radius = 15.0,
  bool isUpperCase = false,
  required Function function,
  required String text,
  var color = Colors.blue,
  double fontSize = 25.0,
}) => Container(
  width: width,
  height: 43.0,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15),
  ),
  child: MaterialButton(
    onPressed: () {
      function();
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(color: Colors.white, fontSize: fontSize),
    ),
  ),
);
