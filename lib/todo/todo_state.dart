import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';

// enum TodoFilter {
//   all,
//   completed,
//   incompleted
// }

abstract class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
 // final TodoFilter status;

  TodoLoaded({this.todos});

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosLoaded { todos: $todos }';
}

class TodoNotLoaded extends TodoState {}
