import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded({this.todos});

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosLoaded { todos: $todos }';
}

class TodoNotLoaded extends TodoState {}
