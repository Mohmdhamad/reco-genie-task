import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'LOGIN',
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black),
        ),
        Text(
          'Login now to browse our menu',
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 25.0),
      ],
    );
  }
}
