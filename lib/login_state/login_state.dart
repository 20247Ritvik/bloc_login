abstract class LoginState{}

class InitState extends LoginState{}

class LoadingState extends LoginState{}

class LoginErrorState extends LoginState{
  late final String errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginInvalidState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginResponseState extends LoginState{}