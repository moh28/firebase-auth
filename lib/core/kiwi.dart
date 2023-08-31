

import 'package:dimo/screens/auth/register/bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';


Future<void> initKiwi() async {
  KiwiContainer container = KiwiContainer();
 // container.registerFactory((container) => LogInBloc());
  container.registerFactory((container) => RegisterBloc());

}