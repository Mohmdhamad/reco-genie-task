import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

AppBar menuAppbar()=>AppBar(
  backgroundColor: Colors.deepOrange,
  centerTitle: true,
  title: DefaultTextStyle(
    style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
    child: AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText('Restaurant'),
        WavyAnimatedText('Look for your Meal'),
      ],
      isRepeatingAnimation: true,
      onTap: (){
      },
    ),
  ),
);