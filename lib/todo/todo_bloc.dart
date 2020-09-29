import 'dart:async';
import 'package:bloc/bloc.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo/todo_state.dart';
import 'package:bloc_login/todo.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo/todo_event.dart';
import 'file:///F:/Flutter/bloc_login/lib/todo_repository/todo_repository.dart';
import 'package:meta/meta.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todosRepository;
  StreamSubscription _todosSubscription;

  TodoBloc({@required TodoRepository todosRepository})
      : assert(todosRepository != null),
        _todosRepository = todosRepository,
        super(TodoLoading());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is LoadTodo) {
      yield* _mapLoadTodosToState();
    } else if (event is AddTodo) {
      yield* _mapAddTodoToState(event);
    } else if (event is UpdateTodo) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is DeleteTodo) {
      yield* _mapDeleteTodoToState(event);
    } else if (event is DoneAll) {
      yield* _mapDoneAllToState();
    } else if (event is DeleteAll) {
      yield* _mapDeleteAllToState();
    } else if (event is TodoUpdated) {
      yield* _mapTodosUpdateToState(event);
    }
  }

  Stream<TodoState> _mapLoadTodosToState() async* {
    _todosSubscription?.cancel();
    _todosSubscription = _todosRepository.todos().listen(
          (todos) => add(TodoUpdated(todos)),
    );
  }

  Stream<TodoState> _mapAddTodoToState(AddTodo event) async* {
    _todosRepository.addTask(event.todo);
  }

  Stream<TodoState> _mapUpdateTodoToState(UpdateTodo event) async* {
    _todosRepository.updateTask(event.updatedTodo);
  }

  Stream<TodoState> _mapDeleteTodoToState(DeleteTodo event) async* {
    _todosRepository.deleteTask(event.deletedTodo);
  }

  Stream<TodoState> _mapDoneAllToState() async* {
    final currentState = state;
    if (currentState is TodoLoaded) {
      final allComplete = currentState.todos.every((todo) => todo.isComplete);
      final List<Todo> updatedTodos = currentState.todos
          .map((todo) => todo.copyWith(isComplete: !allComplete))
          .toList();
      updatedTodos.forEach((updatedTodo) {
        _todosRepository.updateTask(updatedTodo);
      });
    }
  }

  Stream<TodoState> _mapDeleteAllToState() async* {
    final currentState = state;
    if (currentState is TodoLoaded) {
      final List<Todo> completedTodos =
      currentState.todos.where((todo) => todo.isComplete).toList();
      completedTodos.forEach((completedTodo) {
        _todosRepository.deleteTask(completedTodo);
      });
    }
  }

  Stream<TodoState> _mapTodosUpdateToState(TodoUpdated event) async* {
    yield TodoLoaded(event.todos);
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}