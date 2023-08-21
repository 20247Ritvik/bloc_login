import 'package:bloc_login/login_state/login_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/loginrepository.dart';

class LoginCubit extends Cubit<LoginState> {
  //final LoginRepository _repository;

  LoginCubit() : super(InitState());

  Auth(String email , String password){
    if((email.isEmpty || !email.contains('@'))||(password.isEmpty || password.length < 8)){
      emit(LoginErrorState("Error!!"));
    }
    else {
      emit (LoginValidState());
    }
  }
}
