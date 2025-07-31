import 'package:flutter/material.dart';

import '../../../../../core/navigate_functions/navigate_functions.dart';
import '../../screens/login_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(fontSize: 15),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            navigateAndFinish(context, LoginScreen());
          },
          child: Text(
            'Login now',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
