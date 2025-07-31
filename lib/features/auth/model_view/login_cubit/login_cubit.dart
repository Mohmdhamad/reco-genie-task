import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  bool isVisible = true;
  IconData suffix = Icons.visibility_outlined;

  void changeVisibility() {
    isVisible = !isVisible;
    suffix = isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
