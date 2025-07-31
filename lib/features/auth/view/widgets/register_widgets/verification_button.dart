import 'package:flutter/material.dart';
import '../../../model_view/register_cubit/register_cubit.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Didn\'t get email?',
          style: TextStyle(fontSize: 15),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            RegisterCubit.get(context).resendVerificationEmail();
          },
          child: Text(
            'Resend verification',
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
