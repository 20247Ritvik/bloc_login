import 'package:bloc_login/sign_state/sign_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInitState());

  Auth(String username, String email, String password, String conpswd) {
    if ((username.isEmpty) ||
        (email.isEmpty || !email.contains('@')) ||
        (password.isEmpty || password.length < 8)) {
      emit(SignInErrorState("Error!!"));
    } else if (password != conpswd) {
      emit(SignInInvalidState("Password doesn't match"));
    } else {
      emit(SignInValidState());
    }
  }
}
