
import 'package:dimo/screens/auth/register/bloc/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events.dart';
class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super((RegisterInitialState())) {
    on<RegisterPostEvent>(_postSignUp);
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 Future< void> _postSignUp(
      RegisterPostEvent event, Emitter<RegisterStates> emit) async {
    emit(RegisterLoadingState());
    try {
     UserCredential user=await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.emailController.text,
          password: event.passwordController.text);
     if(user.user?.uid!=null) {
       emit(RegisterSuccessState());
     }else if(user.user?.uid==null){
       emit(RegisterNoTokenState());
     }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(RegisterWeakPasswordState());
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
       emit( RegisterAlreadyExistsState());
      }
    } catch (error) {
      emit(RegisterErrorState(msg:error.toString()));
    }
  }
}