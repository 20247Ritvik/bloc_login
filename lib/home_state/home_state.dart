import '../model/modelclass.dart';

abstract class HomeState{}

class HomeInitState extends HomeState{}

class HomeLoadingstate extends HomeState{}

class HomeErrorState extends HomeState{
  final String message;
  HomeErrorState(this.message);
}

class ResponseState extends HomeState {
  final List<User> todos;
  ResponseState(this.todos);
}
