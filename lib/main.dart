import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/todos/todos_bloc.dart';
import 'blocs/todos_status/todos_status_bloc.dart';
import 'screens/home_screen.dart';
import 'models/todo_model.dart';

void main() {
      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              LoadTodos(todos: [
                Todo(
                  id: '1',
                  task: 'Sample ToDo 1',
                  description: 'This is a test To Do',
                ),
                Todo(
                  id: '2',
                  task: 'Sample ToDo 2',
                  description: 'This is a test To Do',
                ),
              ]),
            ),
        ),
        BlocProvider(
          create: (context) => TodosStatusBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Pattern- Todos',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: const Color(0xff000a1f),
            appBarTheme: const AppBarTheme(
              color: Color(0xff000a1f),
            )),
        home: const HomeScreen(),
      ),
    );
  }
}
