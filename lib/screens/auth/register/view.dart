
import 'package:dimo/core/colors.dart';
import 'package:dimo/core/widgets/app_button.dart';
import 'package:dimo/core/widgets/app_input.dart';
import 'package:dimo/screens/auth/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import '../../../core/app_router.dart';
import 'bloc/bloc.dart';
import 'bloc/events.dart';
import 'bloc/states.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final bloc = KiwiContainer().resolve<RegisterBloc>();
  final event = RegisterPostEvent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: bloc.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 31),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 300,
                    ),
                    AppInput(bottom: 16,
                      controller: event.emailController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email';
                        }else {
                          return null;
                        }
                      },
                      hint: 'Email',
                    ),
                    AppInput(
                      secureText: true,
                      controller:event.passwordController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Password";
                        }else {
                          return null;
                        }
                      },
                      hint:'Password',
                      bottom: 8,
                    ),
                    BlocConsumer(
                      bloc: bloc,
                      builder: (BuildContext context, state) {
                        return AppButton(
                        top: 31,
                        bottom: 31,
                        onTap: () {
                          final FormState form = bloc.formKey.currentState!;
                          if (form.validate()) {
                            bloc.add(event);
                          }
                        },
                        component: 'Register',
                      );  },
                      listener: (BuildContext context, Object? state) {
                        if (state is RegisterSuccessState) {
                          ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                            content: Text(state.msg),
                          ));
                          AppRouter.navigateAndFinish(context, const LogInScreen());
                        } else if (state is RegisterWeakPasswordState) {
                          ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                            content: Text(state.msg),
                          ));
                        }
                        else if(state is RegisterAlreadyExistsState){
                          ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                            content: Text(state.msg),
                          ));
                        }else if(state is RegisterErrorState){
                          ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                            content: Text(state.msg),
                          ));
                        }else if(state is RegisterNoTokenState){
                          ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                            content: Text(state.msg),
                          ));
                        }
                      },
                    ),
                  ]
              ),
            ),),)
    );
  }
}
