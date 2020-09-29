
import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';

 class TodoState extends Equatable {
  List<Todo> todos;

  @override
  List<Object> get props => [todos];
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
   List<Todo> todos;
  TodoLoaded([this.todos = const []]);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosLoaded { todos: $todos }';
}

class TodoNotLoaded extends TodoState {}

