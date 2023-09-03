class LogInStates {}
class LogInInitialState extends LogInStates {}
class LogInLoadingState extends LogInStates {}
class LogInSuccessState extends LogInStates {
  final String msg;

  LogInSuccessState(this.msg);
}
class LogInErrorState extends LogInStates {
  final String msg;
 LogInErrorState(this.msg);
}
class LogInWrongPasswordState extends LogInStates {
  final String msg;

  LogInWrongPasswordState(this.msg);
}
class LogInNoUserFoundState extends LogInStates {
  final String msg;

  LogInNoUserFoundState(this.msg);
}
class LogInNoTokenState extends LogInStates {
  final String msg;

  LogInNoTokenState(this.msg);
}