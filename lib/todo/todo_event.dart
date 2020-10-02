import 'package:bloc_login/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ReloadTodo extends TodoEvent {
  final List<Todo> todos;
  ReloadTodo(this.todos);

  @override
  List<Object> get props => [todos];
}

class LoadTodo extends TodoEvent{

}

class AddTodo extends TodoEvent{
  final Todo todo;
  AddTodo(this.todo);
  @override
  List<Object> get props => [todo];
  @override
  String toString() {
    return "AddTodo";
  }
}

class UpdateTodo extends TodoEvent{
  final Todo updatedTodo;
  UpdateTodo(this.updatedTodo);
  @override
  List<Object> get props => [updatedTodo];
  @override
  String toString() {
    return "UpdateTodo";
  }
}

class DeleteTodo extends TodoEvent{
  final Todo deletedTodo;
  DeleteTodo(this.deletedTodo);
  @override
  List<Object> get props => [deletedTodo];
}

class DeleteAll extends TodoEvent{

}

class DoneAll extends TodoEvent{

}

class TodoUpdated extends TodoEvent{
  final List<Todo> todos;
  TodoUpdated(this.todos);
  @override
  List<Object> get props => [todos];
}