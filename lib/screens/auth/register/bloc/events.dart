import 'package:flutter/material.dart';
class RegisterEvents {}
class RegisterPostEvent extends RegisterEvents {
  late TextEditingController emailController, passwordController;
  RegisterPostEvent() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}