import 'package:flutter/material.dart';
class LogInEvents {}
class LogInPostEvent extends LogInEvents {
  late TextEditingController emailController, passwordController;
  LogInPostEvent() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}