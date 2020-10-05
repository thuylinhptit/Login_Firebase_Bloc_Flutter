import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';

enum TodoFilter {
  all,
  completed,
  incompleted
}

abstract class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
  final List<Todo> filterd;
  final TodoFilter status;

  TodoLoaded( {this.todos, this.filterd, this.status = TodoFilter.all});

  @override
  List<Object> get props => [todos,filterd, status];

  @override
  String toString() => 'TodosLoaded { todos: $todos }';
}

class TodoNotLoaded extends TodoState {}

