import 'package:dimo/screens/auth/register/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc_observer.dart';
import 'core/kiwi.dart';
import 'firebase_options.dart';
void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await initKiwi();
 Bloc.observer = MyBlocObserver();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context,child)=>child!,
      home:const RegisterScreen(),
    );
  }
}