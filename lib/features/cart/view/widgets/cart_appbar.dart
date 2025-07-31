import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

AppBar cartAppbar()=>AppBar(
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
        WavyAnimatedText('My Cart'),
      ],
      isRepeatingAnimation: true,
      onTap: (){
      },
    ),
  ),
);