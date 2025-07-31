import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePassVisState());
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.sendEmailVerification();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': email,
        'name': name,
        'phone': phone,
        'emailVerified': false,
      });

      emit(RegisterSuccessState());
    } catch (error) {
      emit(RegisterErrorState(error.toString()));
    }
  }

  void resendVerificationEmail() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      user.sendEmailVerification();
    }
  }
}
