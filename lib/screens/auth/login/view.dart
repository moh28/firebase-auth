
import 'package:dimo/core/colors.dart';
import 'package:dimo/core/widgets/app_button.dart';
import 'package:dimo/core/widgets/app_input.dart';
import 'package:flutter/material.dart';
import '../register/view.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}
class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passwordController=TextEditingController();
  final emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 300,
                ),
                AppInput(bottom: 16,
                  controller: emailController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return"Email";
                    }else {
                      return null;
                    }
                  },
                  hint: 'Email',
                ),

                AppInput(
                  secureText: true,
                  controller:passwordController,
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
                AppButton(
                      top: 31,
                      bottom: 31,
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
                      /*  final FormState form = formKey.currentState!;
                        if (form.validate()) {

                        }*/
                      },
                      component: 'Log In',
                    ),

]
        ),
      ),),)
    );
  }
}
