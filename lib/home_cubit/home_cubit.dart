import 'package:bloc_login/home_state/home_state.dart';
import 'package:bloc_login/homerepository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  HomeCubit(this._repository) : super(HomeInitState());

  Future<void> fetchTodo() async {
    emit(HomeLoadingstate());
    try {
      final response = await _repository.getAll();
      emit(ResponseState(response));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
