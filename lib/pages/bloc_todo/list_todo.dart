import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './todo_entity.dart';
import './todo_bloc.dart';
import './list_todo_detail.dart';

import './todos_event.dart';
import './todos_state.dart';

class ListTodo extends StatefulWidget {
  @override
  _ListTodoState createState() {
/*    
        BlocProviderTree(
        blocProviders: [
          BlocProvider<TodosBloc>(
            builder: (context) => TodosBloc(),
          ),
          // BlocProvider<TimerBloc>(
          //   builder: (context) => TimerBloc(ticker: Ticker()),
          // ),
        ],
        child: this,
      );
*/
    return _ListTodoState();
  }
}

class _ListTodoState extends State<ListTodo> {

  @override
  Widget build(BuildContext context) {
    final title = 'Todo List';
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    todosBloc.dispatch(LoadTodos());

    return BlocBuilder(
      bloc: todosBloc,
      builder: (BuildContext context, TodosState state) {
         final todos = (state as TodosLoaded).todos;

        return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {
                    Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => ListTodoDetail(description: todos[index].description),
                      ),
                    );
                  },
                );
              }
            ),
        );
      },
    );
  }
}

