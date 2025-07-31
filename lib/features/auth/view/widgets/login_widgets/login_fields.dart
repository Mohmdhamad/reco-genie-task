import 'package:flutter/material.dart';

import '../../../../../widgets/text_form_field.dart';
import '../../../model_view/login_cubit/login_cubit.dart';

class LoginFields extends StatelessWidget {
  LoginFields({super.key});

  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginCubit = LoginCubit.get(context);
    return Column(
      children: [
        DefaultTextFormField(
          controller: emailController,
          type: TextInputType.emailAddress,
          label: 'Email Address',
          prefix: Icons.email_outlined,
          validate: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Email address cannot be empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        DefaultTextFormField(
          controller: passwordController,
          type: TextInputType.visiblePassword,
          label: 'Password',
          isPassword: loginCubit.isVisible,
          prefix: Icons.lock_outline_rounded,
          suffix: loginCubit.suffix,
          suffixPressed: () {
            loginCubit.changeVisibility();
          },
          validate: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Password cannot be empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 31.0),
      ],
    );
  }
}
