import 'package:flutter/material.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      children: [
        Text(
          'REGISTER',
          style: Theme.of(context).textTheme.headlineMedium!
              .copyWith(color: Colors.black),
        ),
        Text(
          'Register now to browse our menu',
          style: Theme.of(context).textTheme.headlineSmall!
              .copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}
