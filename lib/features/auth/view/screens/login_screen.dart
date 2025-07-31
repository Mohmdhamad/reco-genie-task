import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_task/features/auth/view/widgets/login_widgets/login_fields.dart';
import '../../../../core/navigate_functions/navigate_functions.dart';
import '../../../../widgets/default_floating_button.dart';
import '../../../menu/view/screens/menu_screen.dart';
import '../../model_view/login_cubit/login_cubit.dart';
import '../../model_view/login_cubit/login_states.dart';
import '../widgets/login_widgets/login_title.dart';
import '../widgets/login_widgets/register_button.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login successful'),
                backgroundColor: Colors.green,
              ),
            );
            navigateAndFinish(context, MenuScreen());
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          var loginCubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      LoginTitle(),
                      LoginFields(),
                      defaultFloatingButton(
                        text: "Login",
                        function: () {
                          if (formKey.currentState!.validate()) {
                            loginCubit.userLogin(
                              email: LoginFields.emailController.text,
                              password: LoginFields.passwordController.text,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      RegisterButton(),
                    ],
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
