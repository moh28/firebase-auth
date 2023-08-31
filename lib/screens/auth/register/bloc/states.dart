class RegisterStates {}
class RegisterInitialState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {
}
class RegisterErrorState extends RegisterStates {
  final String? msg;
  RegisterErrorState({this.msg});
}
class RegisterWeakPasswordState extends RegisterStates {}
class RegisterAlreadyExistsState extends RegisterStates {}
class RegisterNoTokenState extends RegisterStates {}