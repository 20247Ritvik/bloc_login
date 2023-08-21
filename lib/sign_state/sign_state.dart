abstract class SignInState {}

class SignInitState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  late final String errorMessage;

  SignInErrorState(this.errorMessage);
}

class SignInInvalidState extends SignInState {
  late final String errorMessage;

  SignInInvalidState(this.errorMessage);
}

class SignInValidState extends SignInState {}

class SignInResponseState extends SignInState {}
