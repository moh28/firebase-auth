
import 'package:dimo/screens/auth/register/bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';
import '../screens/auth/login/bloc/bloc.dart';
Future<void> initKiwi() async {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => RegisterBloc());
  container.registerFactory((container) => LogInBloc());
}