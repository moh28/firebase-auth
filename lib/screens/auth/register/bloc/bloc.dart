
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
       emit(RegisterSuccessState('Registered Successfully'));
     }else if(user.user?.uid==null){
       emit(RegisterNoTokenState("Oops there is a problem"));
     }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterWeakPasswordState('The password provided is too weak.' ));
      } else if (e.code == 'email-already-in-use') {
       emit( RegisterAlreadyExistsState( 'The account already exists for that email.'));
      }
    } catch (error) {
      emit(RegisterErrorState('Check Your Internet Connection'));
    }
  }
}