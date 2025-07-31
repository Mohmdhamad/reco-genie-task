import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/default_floating_button.dart';
import '../../model_view/register_cubit/register_cubit.dart';
import '../../model_view/register_cubit/register_states.dart';
import '../widgets/register_widgets/login_button.dart';
import '../widgets/register_widgets/register_fields.dart';
import '../widgets/register_widgets/register_title.dart';
import '../widgets/register_widgets/verification_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterFields fields = RegisterFields();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Check your email to verify')),
            );
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      spacing: 10,
                      children: [
                        RegisterTitle(),
                        RegisterFields(),
                        if (state is RegisterLoadingState)
                          CircularProgressIndicator()
                        else
                          defaultFloatingButton(
                            text: 'Register',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                  email: fields.emailController.text,
                                  password: fields.passController.text,
                                  name: fields.nameController.text,
                                  phone: fields.phoneController.text,
                                );
                              }
                            },
                          ),
                        VerificationButton(),
                        LoginButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
