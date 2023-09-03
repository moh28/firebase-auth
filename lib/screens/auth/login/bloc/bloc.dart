
import 'package:dimo/screens/auth/login/bloc/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class LogInBloc extends Bloc<LogInEvents, LogInStates> {
  LogInBloc() : super((LogInInitialState())) {
    on<LogInPostEvent>(_postSignUp);
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final auth=FirebaseAuth.instance;
  Future< void> _postSignUp(
      LogInPostEvent event, Emitter<LogInStates> emit) async {
    emit(LogInLoadingState());
    try {
      UserCredential user=await  auth.signInWithEmailAndPassword(email: event.emailController.text,
          password: event.passwordController.text,);
      if(user.user?.uid!=null) {
        emit(LogInSuccessState('LogIn Successfully'));
      }else if(user.user?.uid==null){
        emit(LogInNoTokenState("Oops there is a problem"));
      }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LogInNoUserFoundState('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LogInWrongPasswordState('Wrong password provided for that user.'));
      }
    } catch (error) {
      emit(LogInErrorState('Check Your Internet Connection'));
    }
  }
}
