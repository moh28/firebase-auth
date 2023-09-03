class RegisterStates {}
class RegisterInitialState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {
  final String msg;

  RegisterSuccessState(this.msg);
}
class RegisterErrorState extends RegisterStates {
  final String msg;
  RegisterErrorState(this.msg);
}
class RegisterWeakPasswordState extends RegisterStates {
  final String msg;

  RegisterWeakPasswordState(this.msg);
}
class RegisterAlreadyExistsState extends RegisterStates {
  final String msg;

  RegisterAlreadyExistsState(this.msg);
}
class RegisterNoTokenState extends RegisterStates {
  final String msg;

  RegisterNoTokenState(this.msg);
}