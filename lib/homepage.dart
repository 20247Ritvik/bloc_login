import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit/home_cubit.dart';
import 'home_state/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<HomeCubit>();
      cubit.fetchTodo();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeInitState || state is HomeLoadingstate) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ResponseState) {
        final todos = state.todos;
        return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title.toString()),
              );
            });
      }
      return Center(
        child: Text(state.toString()),
      );
    }));
  }
}
