import 'package:flutter/material.dart';

import '../../../../../widgets/text_form_field.dart';
import '../../../model_view/register_cubit/register_cubit.dart';

class RegisterFields extends StatelessWidget {
  RegisterFields({super.key});

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return Column(
      spacing: 10,
      children: [
        DefaultTextFormField(
          controller: nameController,
          label: 'Name',
          type: TextInputType.name,
          validate: (value) {
            if (value!.isEmpty) return 'Name is required';
            return null;
          },
          prefix: Icons.person,
        ),
        DefaultTextFormField(
          controller: emailController,
          label: 'Email',
          type: TextInputType.emailAddress,
          validate: (value) {
            if (value!.isEmpty) return 'Email is required';
            return null;
          },
          prefix: Icons.email,
        ),
        DefaultTextFormField(
          controller: phoneController,
          label: 'Phone',
          type: TextInputType.phone,
          validate: (value) {
            if (value!.isEmpty) return 'Phone is required';
            return null;
          },
          prefix: Icons.phone,
        ),
        DefaultTextFormField(
          controller: passController,
          label: 'Password',
          type: TextInputType.visiblePassword,
          isPassword: cubit.isPassword,
          suffix: cubit.suffix,
          suffixPressed: () => cubit.changePasswordVisibility(),
          validate: (value) {
            if (value!.isEmpty) return 'Password is required';
            return null;
          },
          prefix: Icons.lock,
        ),
      ],
    );
  }
}
