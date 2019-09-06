import 'package:bloc/bloc.dart';

import './todos_event.dart';
import './todos_state.dart';
import './todo_entity.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {

@override
  TodosState get initialState => TodosLoading();

@override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    print('Action: $event');
    if (event is LoadTodos) {
      yield* _mapLoadTodosToState();
    }
  }

  Stream<TodosState> _mapLoadTodosToState() async* {
    try {
      //final todos = await this.todosRepository.loadTodos();
    final List<TodoEntity> todos = List.generate(
    20, (i) => TodoEntity('Todo ㅎㅎ $i', 'A description of what needs to be done for Todo $i'));

      yield TodosLoaded(
        todos.toList(),
      );
    } catch (_) {
      yield TodosNotLoaded();
    }
  }


}