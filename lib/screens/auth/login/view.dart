import 'package:dimo/core/colors.dart';
import 'package:dimo/core/widgets/app_button.dart';
import 'package:dimo/core/widgets/app_input.dart';
import 'package:dimo/screens/auth/login/bloc/states.dart';
import 'package:dimo/screens/auth/register/view.dart';
import 'package:dimo/screens/chat/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import '../../../core/app_router.dart';
import 'bloc/bloc.dart';
import 'bloc/events.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final bloc = KiwiContainer().resolve<LogInBloc>();
  final event = LogInPostEvent();

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
                AppInput(
                  bottom: 16,
                  controller: event.emailController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Email";
                    } else {
                      return null;
                    }
                  },
                  hint: 'Email',
                ),
                AppInput(
                  secureText: true,
                  controller: event.passwordController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Password";
                    } else {
                      return null;
                    }
                  },
                  hint: 'Password',
                  bottom: 8,
                ),
                BlocConsumer(
                  bloc: bloc,
                  builder: (BuildContext context, state) {
                    return AppButton(
                      color: Colors.white,
                      top: 31,
                      bottom: 31,
                      onTap: () {
                        final FormState form = bloc.formKey.currentState!;
                        if (form.validate()) {
                          bloc.add(event);
                        }
                      },
                      component: 'Log In',
                    );
                  },
                  listener: (BuildContext context, Object? state) {
                    if (state is LogInSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.msg),
                      ));
                      AppRouter.navigateAndFinish(
                          context, const ChatPage());
                    } else if (state is LogInWrongPasswordState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.msg),
                      ));
                    } else if (state is LogInNoUserFoundState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.msg),
                      ));
                    } else if (state is LogInErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.msg),
                      ));
                    } else if (state is LogInNoTokenState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.msg),
                      ));
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'have no account?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          AppRouter.navigateAndFinish(context, const RegisterScreen());
                        },
                        child: const Text(
                          ' Register now',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            color:  Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
