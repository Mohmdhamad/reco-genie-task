import 'package:flutter/material.dart';
import '../../../../../core/navigate_functions/navigate_functions.dart';
import '../../../../../widgets/text_button.dart';
import '../../screens/register_screen.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Don\'t have an account?', style: TextStyle(fontSize: 15.0)),
        const Spacer(),
        defaultTextButton(
          function: () {
            navigateAndFinish(context, RegisterScreen());
          },
          text: 'Register',
          isUpperCase: false,
        ),
      ],
    );
  }
}
